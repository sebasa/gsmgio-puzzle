#!/usr/bin/env python3
"""
GSMG.IO Phase 1 Verification - Password Tester
Reads candidate keys from claves.txt and tests them against the form.
"""

import re
import sys
import time
import requests

URL_PAGE = "https://gsmg.io/theseedisplanted"
URL_POST = "https://gsmg.io/phase1verification"
CLAVES_FILE = "claves.txt"  # Same directory as this script, or provide full path

def load_keys(filepath):
    """Load candidate keys from file, skip empty lines and duplicates while preserving order."""
    seen = set()
    keys = []
    with open(filepath, "r", encoding="utf-8") as f:
        for line in f:
            key = line.strip()
            if key and key not in seen:
                seen.add(key)
                keys.append(key)
    return keys

def get_csrf_token(session):
    """GET the form page and extract the CSRF token."""
    resp = session.get(URL_PAGE, timeout=30)
    resp.raise_for_status()
    # Try multiple patterns to find the token
    match = re.search(r'name="_token"\s+(?:type="hidden"\s+)?value="([^"]+)"', resp.text)
    if not match:
        match = re.search(r'value="([^"]+)"[^>]*name="_token"', resp.text)
    if not match:
        match = re.search(r'_token["\s:]+["\']([A-Za-z0-9]+)["\']', resp.text)
    if not match:
        raise RuntimeError("Could not find CSRF token in page")
    return match.group(1)

def try_password(session, password, index, total):
    """Try a single password. Returns True if it appears to be accepted."""
    try:
        token = get_csrf_token(session)
    except Exception as e:
        print(f"  [!] Error getting CSRF token: {e}")
        return False

    data = {
        "_token": token,
        "password": password,
    }

    try:
        resp = session.post(URL_POST, data=data, timeout=30, allow_redirects=True)
    except Exception as e:
        print(f"  [!] Error posting: {e}")
        return False

    status = resp.status_code
    final_url = resp.url
    body_preview = resp.text[:500].lower()

    # Detect success heuristics
    redirected_away = (URL_POST not in final_url) and (URL_PAGE not in final_url)
    has_error = any(word in body_preview for word in ["incorrect", "invalid", "wrong", "error", "denied", "fail"])
    has_success = any(word in body_preview for word in ["success", "correct", "congratul", "welcome", "phase 2", "next"])

    display_pw = password[:60] + ("..." if len(password) > 60 else "")
    print(f"[{index:3d}/{total}] {display_pw}")
    print(f"         Status: {status} | Redirect: {redirected_away} | URL: {final_url[:80]}")

    if has_success or (redirected_away and not has_error):
        print(f"\n{'='*60}")
        print(f"  >>> POSSIBLE MATCH: {password}")
        print(f"  >>> Final URL: {final_url}")
        print(f"{'='*60}\n")
        # Save the match
        with open("gsmg_match.txt", "a", encoding="utf-8") as f:
            f.write(f"Password: {password}\nURL: {final_url}\nStatus: {status}\n\n")
        return True

    if has_error:
        print(f"         -> Rejected")

    return False

def main():
    filepath = sys.argv[1] if len(sys.argv) > 1 else CLAVES_FILE
    keys = load_keys(filepath)
    print(f"Loaded {len(keys)} unique keys from {filepath}\n")

    session = requests.Session()
    session.headers.update({
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"
    })

    found = 0
    for i, key in enumerate(keys, 1):
        if try_password(session, key, i, len(keys)):
            found += 1
        # Small delay to be polite to the server
        time.sleep(1.5)

    print(f"\nDone. Tested {len(keys)} keys. Possible matches: {found}")
    if found:
        print("Check gsmg_match.txt for details.")

if __name__ == "__main__":
    main()