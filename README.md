# GSMG.IO 5 BTC Puzzle Hints

This repository contains all publicly known hints and partial solutions for the **GSMG.IO 5 BTC puzzle challenge**. Contributions and further decoding are highly welcome!

> **Support:** If you find this useful, please consider donating BTC to: [`1JK27jtvE1wS4VG9k7Zpo8wBufMbYwy3r8`](https://www.blockchain.com/btc/address/1JK27jtvE1wS4VG9k7Zpo8wBufMbYwy3r8)

![Puzzle Image](./puzzle.png)

## Table of Contents
- [Summary](#summary)
- [Tools](#tools)
- [Walkthrough](#walkthrough)
  - [Phase 1: The Binary Matrix](#phase-1-the-binary-matrix)
  - [Phase 2: The Seed is Planted](#phase-2-the-seed-is-planted)
  - [Phase 3: Choice is an Illusion](#phase-3-choice-is-an-illusion)
    - [Phase 3.1: Passwords Assembly](#phase-31-passwords-assembly)
    - [Phase 3.2: The Merovingian](#phase-32-the-merovingian)
    - [Phase 3.2.1: Beaufort Cipher](#phase-321-beaufort-cipher)
    - [Phase 3.2.2: VIC Cipher](#phase-322-vic-cipher)
- [Additional Hints](#additional-hints)
  - [Decentraland Audio Hint](#decentraland-audio-hint)
  - [Poem from the Creator](#poem-from-the-creator)
- [Salphaseion and Cosmic Duality](#salphaseion-and-cosmic-duality)
  - [Decoding Salphaseion](#decoding-salphaseion)

---

## Summary
- The puzzle was originally published at [https://gsmg.io/puzzle](https://gsmg.io/puzzle).
- The prize address holding the 5 BTC is [`1GSMG1JC9wtdSwfwApgj2xcmJPAwx7prBe`](https://www.blockchain.com/btc/address/1GSMG1JC9wtdSwfwApgj2xcmJPAwx7prBe).
  - *Note:* The creator intended to halve the prize each time a Bitcoin halving occurs. The first halving during the puzzle was on May 11, 2020. The intended value is mathematically 2.5 BTC right now.
- **Discussions on Reddit:** 
  - [gsmgio_5_btc_puzzle](https://www.reddit.com/r/bitcoinpuzzles/comments/dfwcqk/gsmgio_5_btc_puzzle/)
  - [gsmgio_5_btc_puzzle_challenge](https://www.reddit.com/r/bitcoinpuzzles/comments/bf7siz/gsmgio_5_btc_puzzle_challenge/)

---

## Tools
- **SHA256 Online Tool**: [XORBIN](https://xorbin.com/tools/sha256-hash-calculator)
- **AES Decryption**: Secure text elements are typically encrypted using OpenSSL's AES cipher. Use [OpenSSL](https://www.openssl.org/).

**Useful OpenSSL command structure:**
```bash
openssl enc -aes-256-cbc -d -a -in <filename> -out <output_filename>
```
*Useful OpenSSL flags:*
- `-d`: decrypts data
- `-a`: tells OpenSSL that the encrypted data is in base64
- `-in <filename>`: specifies the file to decrypt
- `-out <filename>`: specifies the file to put the decrypted data in

---

## Walkthrough

### Phase 1: The Binary Matrix
**URL:** `https://gsmg.io/puzzle`

The initial image contains squares which represent bits. 
- **Black/Blue** = `1`
- **Yellow/White** = `0`

It forms a 14x14 binary matrix:
```text
0 0 1 1 0 1 0 0 1 0 1 1 0 0
1 1 1 1 0 0 1 1 1 0 1 0 1 1
1 1 0 1 1 1 0 1 0 0 1 0 0 1
0 1 1 0 1 0 0 0 0 1 1 1 0 1
0 1 1 0 0 0 1 1 0 0 0 1 1 0
1 0 0 1 1 0 0 0 1 0 0 0 1 1
1 0 0 1 1 1 0 0 0 1 0 0 0 0
1 1 1 0 0 0 0 0 0 0 1 0 0 0
0 0 0 1 1 1 0 1 1 1 1 1 0 1
1 1 1 1 1 1 0 0 1 1 0 0 0 1
1 1 0 1 0 0 0 0 0 1 1 0 1 1
1 1 1 1 0 0 1 0 1 0 1 1 0 0
0 1 0 1 1 1 0 1 0 0 0 1 1 0
0 1 1 0 1 1 0 1 1 0 1 0 1 1
```

Start from the upper-left square and read **counterclockwise in a spiral**. Convert the 8-bit groups to ASCII characters:
```text
01100111 (103 g)
01110011 (115 s)
01101101 (109 m)
01100111 (103 g)
00101110 (46 .)
01101001 (105 i)
01101111 (111 o)
00101111 (47 /)
01110100 (116 t)
01101000 (104 h)
01100101 (101 e)
01110011 (115 s)
01100101 (101 e)
01100101 (101 e)
01100100 (100 d)
01101001 (105 i)
01110011 (115 s)
01110000 (112 p)
01101100 (108 l)
01100001 (97 a)
01101110 (110 n)
01110100 (116 t)
01100101 (101 e)
01100100 (100 d)
```

**Resulting string:** `gsmg.io/theseedisplanted`

---

### Phase 2: The Seed is Planted
**URL:** `https://gsmg.io/theseedisplanted`

![The Seed is Planted](./theseedisplanted.png)

The pictures refer to the song **The Warning (by Logic)**. You can decipher this by rearranging the images: `war` + `ning` and `LO` + (crypto) `gic`.

**Lyrics:**
> **intro**
> The warning
> 
> **verse**
> Phase one
> The seed is planted when opposites attract
> Can you dig it?
> It takes the physical to create the physical
> 
> Phase two
> The flower blossoms through what seems to be a concrete surface
> i.e. greed, racism, insanity, physical and social handicaps
> These are the things that mob the flower
> Red rose or black rose; no in-between
> 
> Phase 3
> The Judgement
> If it were to fall upon you today, which flower would you be?
> The red rose or the black?
> 
> **outro**
> This is the warning

This webpage also contains a hidden `POST` form accessible via your browser's Developer Tools (F12 in Chrome).
1. Unhide it.
2. Enter the password: `theflowerblossomsthroughwhatseemstobeaconcretesurface`
3. Hit the **Submit** button to be redirected to the next step.

---

### Phase 3: Choice is an Illusion
**URL:** `https://gsmg.io/choiceisanillusioncreatedbetweenthosewithpowerandthosewithoutaveryspecialdessertiwroteitmyself`

![Phase 2 Image](./phase2.png)

This phase's title references a quote from *The Matrix Reloaded*:
> **Merovingian:** You see, there is only one constant one universal: ***causality*** - cause and effect.
> **Morpheus:** Everything begins with choice.
> **Merovingian:** No. Wrong. ***Choice is an illusion created between those with power and those without***.

The primary password for this step's payload is `causality`.
Hashing it yields the decryption key:
`SHA256(causality) = eb3efb5151e6255994711fe8f2264427ceeebf88109e1d7fad5b0a8b6d07e5bf`

Decrypt the provided text (`phase2.txt`) in your terminal:
```bash
openssl enc -aes-256-cbc -d -a -in phase2.txt -pass pass:eb3efb5151e6255994711fe8f2264427ceeebf88109e1d7fad5b0a8b6d07e5bf
```

**Decryption Result:**
```text
The ironic 2name of the keymakers trying to protect the current digital powers which are still in severe danger due to the keymaker's way of security by hiding, nearly unprotected, in plain sight. {eps3.4_[in one of the valleys of Phillip]runtime-error.r00., where daughters hit magic keypads} When this fails.. Crypto finally to the latin 3Moon? Tell me, 4How so mate?
# X 2 S H 4 Y 0 Q B 15 #
Q -> extend the name of a hackers' swordless fish, the I and W are below.
B -> ((BV80605001911AP)- (sqrt(-1)))^2
H -> (Answer to only this puzzle but nothing else) * -1
S -> cha' + (vagh * jav)
Ok kid, on the highway, let put it in the worst gear.
```

*(Note: It is somewhat unclear how all equations relate, but researchers noted that `S` equals Klingon numbers `2+(5*6)=32` and `BV80605001911AP` is an Intel i5 processor model, evaluating `B` to `(5i-i)^2 = 16i^2 = -16`.)*

#### Phase 3.1: Passwords Assembly
Using the other hints (2name, 3Moon, 4How so mate) which refer to a [Thales Hardware Security Module](https://thalesdocs.com/gphsm/luna/10.1/docs/network/Content/Product_Overview/the_safenet_hsm/the_safenet_hsm.htm), you must assemble a massive, 7-part password.

**The Parts:**
1. `causality` - Established in the beginning.
2. `Safenet` - From "2name" reference.
3. `Luna` - From "3Moon" reference.
4. `HSM` - Hardware Security Module ("4How so mate").
5. `11110` - A reference to John F. Kennedy's Executive Order 11110 ("A ruler with a number... 5binary code" trying to rein in the Federal Reserve). 
6. `0x736B6E616220726F662074756F6C69616220646E6F63657320666F206B6E697262206E6F20726F6C6C65636E61684320393030322F6E614A2F33302073656D695420656854` - "raw data after 4 on row 1616" points to the genesis block in the [source code to Bitcoin itself](https://sourceforge.net/p/bitcoin/code/133/tree/trunk/main.cpp#l1616). (And `"/(aBa, connected enf)"` means keep casing and remove whitespace).
7. `B5KR/1r5B/2R5/2b1p1p1/2P1k1P1/1p2P2p/1P2P2P/3N1N2 b - - 0 1` - "A buddhist is forced to move...": A chess position reference after a move that avoids a checkmate. (`"/(aBa, connected not enf)"` means keep whitespace).

**Concatenate all 7 parts exactly and take the SHA256 hash:**
```text
SHA256(causalitySafenetLunaHSM111100x736B6E616220726F662074756F6C69616220646E6F63657320666F206B6E697262206E6F20726F6C6C65636E61684320393030322F6E614A2F33302073656D695420656854B5KR/1r5B/2R5/2b1p1p1/2P1k1P1/1p2P2p/1P2P2P/3N1N2 b - - 0 1)
= 1a57c572caf3cf722e41f5f9cf99ffacff06728a43032dd44c481c77d2ec30d5
```

This hash acts as the key to decrypt `phase3.txt`:
```bash
openssl enc -aes-256-cbc -d -a -in phase3.txt -pass pass:1a57c572caf3cf722e41f5f9cf99ffacff06728a43032dd44c481c77d2ec30d5
```

**Decryption Result of `phase3.txt`:**
```text
What if the merovingian is wrong. What instead of causality something else could be ours? Therefor, if so, the ...... is ours. The thinker's 1name behind all of that would grant you access to the next step (of humanity). Definitely look into his works might you have time. /(aa,connected enf)

I just passed a cheshire cat and I'm getting fed up with this puzzle.. It's taking forever. But, How long is forever? I don't know, but just add giveit in front of the answer and you can fall in the keyhole. /(aa,connected enf)

3.The fundamental limit to the precision with which certain pairs of physical properties are know. /(aa,connected enf)

Phase 3.2 is ciphered with aes-256-cbc base64 and a sha256 pw, yet again.
U2FsdGVkX1/u/Exb78Fl...
```

#### Phase 3.2: The Merovingian
Assemble the next password from the hints in the decrypted text above:
1. "The thinker's 1name behind all of that..." -> Jacque Fresco ("The future is fluid... The future is ours to direct.") -> **`jacquefresco`**
2. "I just passed a cheshire cat... How long is forever? add giveit in front..." -> Alice in Wonderland quote: "Sometimes, just one second" -> **`giveitjustonesecond`**
3. "3.The fundamental limit to the precision..." -> **`heisenbergsuncertaintyprinciple`**

Combine these into the next password string:
`jacquefrescogiveitjustonesecondheisenbergsuncertaintyprinciple`

Its SHA256 hash is:
`250f37726d6862939f723edc4f993fde9d33c6004aab4f2203d9ee489d61ce4c`

Decrypt `phase3.2.txt` (the Base64 payload from `phase3.txt`) using this hash:
```bash
openssl enc -aes-256-cbc -d -a -in phase3.2.txt -pass pass:250f37726d6862939f723edc4f993fde9d33c6004aab4f2203d9ee489d61ce4c
```

**Decrypted Text (`phase3.2.txt`):**
```text
I've been waiting for you. You have many questions, and although the process has altered your consciousness, you remain irrevocably human. Ergo, some of my answers you will understand, and some of them you will not. Concordantly, while your first question may be the most pertinent, you may or may not realize it is also irrelevant.

... am I here? Wake up, you... I've designed you a beautiful strategic position. One for one, four for one.

╬╚,╬°%_┴°°╟%═╧/╟╚:_Ў°├╤°... [Large Obfuscated Block 1]

151659431219724091691... [Large Numeric Block 2]

Raising the stakes without extra chances of winning. A fubcd-king & oracle-queen, thingky mvps, on a sad board but as wide as the first one seen.

U2FsdGVkX1+0Wl49gn... [AES Blob 3]
```

#### Phase 3.2.1: Beaufort Cipher
In the decrypted text, clues:
- "... am I here? Wake up, you..." -> From *The Matrix*: "The matrix has you" (replacing neo with you). So the key is **`THEMATRIXHASYOU`**.
- "beautiful strategic position" -> **Beaufort cipher**.
- "one for one, four for one" -> 1141 -> **IBM EBCDIC 1141** encoding.

The symbol blob (Block 1) translated via EBCDIC 1141 yields a sequence of letters: 
`vtkvplmepphluw... (snip)`

Go to a cipher tool like [CipherTools](https://ciphertools.co.uk/decode.php), paste the string, select **Beaufort**, and use the key **THEMATRIXHASYOU**. The translated message resembles The Architect from *The Matrix*:
> `YOUR LIFE IS THE SUM OF A REMAINDER OF AN UNBALANCED EQUATION... THE FUNCTION OF THE YOU IS NOW TO RETURN TO THE SOURCE CODES... AFTER WHICH YOU WILL BE REQUIRED TO SELECT FROM OVER TWENTY-THREE CIPHERS SIXTEEN ENCRYPTIONS AND OR SEVEN INTERTWINED PASSWORDS TO FIND THE ACTUAL PRIVATE KEYNOTE... GOOD LUCK NEVERTHELESS I REALLY HOPE YOURE THE ONE CIAO BELLA O`

#### Phase 3.2.2: VIC Cipher
The number string:
`1516594312197240916917121375...`
Clues sentence: "A fubcd-king & oracle-queen, thingky mvps, on a sad board but as wide as the first one seen."

This references the **VIC Cipher**.
- Removing repeating characters: `FUBCD ORA.LE THINGKY MVPS`
- Appending the remaining letters: `FUBCDORA.LETHINGKYMVPS/JQZXW`

Using a [VIC Cipher Decoder](https://www.dcode.fr/vic-cipher):
- **Alphabet:** `FUBCDORA.LETHINGKYMVPS.JQZXW`
- **Digit 1:** `1`
- **Digit 2:** `4`
- **Input code:** `1516594...`

**Result:**
> `IN CASE YOU MANAGE TO CRACK THIS THE PRIVATE KEYS BELONG TO HALF AND BETTER HALF AND THEY ALSO NEED FUNDS TO LIVE`

---

## Additional Hints

### Decentraland Audio Hint
![Decentraland Image](./photo_2020-04-26_09-24-30.jpg)

There is a hint from the puzzle creator in Decentraland. By going to the coordinates shown, you trigger an audio file.
**Solution:** Split the stereo track, invert one side, mix them back, convert to mono, and generate a spectrogram. The visual wave output reads: **`HASHTHETEXT`**

### Poem from the Creator
```text
Roses are White but often Red.
Yellow has a number and so does Blue.
Go back to the first puzzle piece without further ado.

It might have shown you only one door, beware that the rabbits nest may contain a whole lot more.

Hush hush.
```

Go to the very first puzzle base page (`https://gsmg.io/puzzle`) and run SHA256 on the primary textual content:
`GSMGIO5BTCPUZZLECHALLENGE1GSMG1JC9wtdSwfwApgj2xcmJPAwx7prBe`

`SHA256(...) = 89727c598b9cd1cf8873f27cb7057f050645ddb6a7a157a110239ac0152f6a32`

This hash leads to a hidden endpoint for Salphaseion:
`https://gsmg.io/89727c598b9cd1cf8873f27cb7057f050645ddb6a7a157a110239ac0152f6a32`

---

## Salphaseion and Cosmic Duality

![Salphaseion Image](./SalPhaselonCosmicDuality.png)

This hidden phase can be split into multiple sections. Currently, only some have been partially decoded. There are a series of letters intermingled with `z` markers, a long binary-like string containing `abba`, and an AES blob:

> `d b b i b f b h c c b e g b...`
> `s h a b e f o u r f i r s t h i n t i s y o u r l a s t c o m m a n d `
> `U 2 F s d G V k X 1 8 6 t Y U... ` *(AES Payload)*
> `s h a b e f a n s t o o`
> *(And large string of "abba"s)*

### Decoding Salphaseion

The two highlighted `abba` sections can be decoded first. Treat **`a = 0`** and **`b = 1`**, and interpret the resulting strings as 8-bit binary representation of ASCII characters:

1. `a b b a b b a b a b b...` -> **`matrixsumlist`**
2. `a b b a a b a b a b b...` -> **`enter`**

**The "shabef" Encoding:**
We see the sequence `shabef` directly before English text `"our first hint is your last command"`.
In previous steps, the first command was `sha256`. Therefore, we infer a mapping:
`s=s, h=h, a=a, b=2, e=5, f=6` -> Meaning it maps purely to its alphabetical position (`a=1, b=2 ... z=26`) representing `sha256`.

The letter `z` seems to act as a separator to segment the character blocks:
- **Block 1:** `a g d a f a o a h e i e c g g c h g i c b b h c g b e h c f c o a b i c f d h h c d b b c a g b d a i o b b g b e a d e d d e`
- **Block 2:** `c f o b f d h g d o b d g o o i i g d o c d a o o f i d h`

Since letters only range from `a-i` and `o`, we translate `a-i` to `1-9` and `o` to `0`:
1. `174161018595377387932283725836301293648834223172419022725145445`
2. `36026487402470099740341006948`

Treating these sequences as Base-16 integers provides corresponding hex strings, which map to ASCII text:
1. Translates to: **`lastwordsbeforearchichoice`**
2. Translates to: **`thispassword`**

*(Further steps to decrypt the remaining AES blob in Salphaseion with these passwords are ongoing...)*
