# RPI-5Ghz-Config

Basic config for setting the hostapd to 5GHz for specific countries

[Useful website that shows hostapd flags](https://w1.fi/cgit/hostap/plain/hostapd/hostapd.conf)
 
To check countries valid wifi ranges, use:

```bash
im reg get
```

For setting the country use:

```bash
sudo im reg set COUNTRY_CODE
```

For Canada, this would be:

```bash
sudo im reg set CA 
```

## Running the script

```bash
./setupWifiAP5G.sh TEAM TEAM_NUMBER PASSWORD COUNTRY_CODE CHANNEL
```

Using the lookup table **5G-WIFI-LIST** it is possible for **interfaceSetUp** to get the correct index and apply it to **hostapd**. 

## Explaining hostapd 

- **hw_mode=a** Will set the interface to 5GHz
- **country_code=CA** Will set the interface to use that specific country code. Note this is required for 5GHz use.
- **vht_oper_chwidth=0** Should be set to 0 as the RPI only supports 20MHz
- **vht_oper_centr_freq_seg0_idx=0** Should be set to the index shown in () next to the channel number
- **channel=0** Should be set to the channel number required

## Some Notes

1. DFS bandwidths should not be used as weather and radar have priority. If a DFS pulse is sent out, this will halt the wifi for the countries specific wait period. For example, 10s in Europe. 
2. Some bandwidths cannot be used outside. For example, for Canada, the **5150 - 5250** range is restricted to indoor use only. 
3. Some countries have the **5150 - 5250** & **5735 - 5835** bandwidths, whereas others only have the **5150 - 5250** bandwidths. 
4. If an incorrect channel is selected **interfaceSetUp** does not change to the selected channel.

## Country Codes with valid channels

---

### United States
 
Country Code: **US**

Valid Channels:  **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country US: DFS-FCC

- (2402 - 2472 @ 40), (N/A, 30), (N/A)
- (5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
- (5490 - 5730 @ 160), (N/A, 23), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)
- (57240 - 63720 @ 2160), (N/A, 40), (N/A)

---

### Canada
 
Country Code: **CA**

Valid Channels:  **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country CA: DFS-FCC
	
- (2402 - 2472 @ 40), (N/A, 30), (N/A)
- (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
- (5250 - 5350 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
- (5470 - 5600 @ 80), (N/A, 24), (0 ms), DFS
- (5650 - 5730 @ 80), (N/A, 24), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)
   
---

### Japan

Country Code: **JP3**

Valid Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country JP: DFS-JP
- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (2474 - 2494 @ 20), (N/A, 20), (N/A), NO-OFDM
- (4910 - 4990 @ 40), (N/A, 23), (N/A)
- (5030 - 5090 @ 40), (N/A, 23), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 23), (0 ms), DFS
- (59000 - 66000 @ 2160), (N/A, 10), (N/A)

---

### Germany

Country Code: **DE**

Vaild Channels: 

---

### Netherlands

Country Code: **NL**

Vaild Channels: 

---

### Italy

Country Code: **IT**

Vaild Channels: 

---

### Portugal

Country Code: **PT**

Vaild Channels: 

---   

### Luxembourg

Country Code: **LU**

Vaild Channels: 

---

### Norway

Country Code: **NO**

Vaild Channels: 

---

### Finland

Country Code: **FI**

Vaild Channels: 

---

### Denmark

Country Code: **DK**

Vaild Channels: 

---

### Switzerland

Country Code: **CH**

Vaild Channels: 

---

### Czech Replublic

Country Code: **CZ**

Vaild Channels: 

--- 

### Spain

Country Code: **ES**

Vaild Channels: 

---

### United Kingdom

Country Code: **GB**

Vaild Channels: 

---

### Korea

Country Code: **KR**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country KR: DFS-JP

- (2402 - 2482 @ 40), (N/A, 13), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 30), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)
- (57000 - 66000 @ 2160), (N/A, 43), (N/A)

--- 

### China

Country Code: **CN**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country CN: DFS-FCC

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
- (5735 - 5835 @ 80), (N/A, 30), (N/A)
- (57240 - 59400 @ 2160), (N/A, 28), (N/A)
- (59400 - 63720 @ 2160), (N/A, 44), (N/A)
- (63720 - 65880 @ 2160), (N/A, 28), (N/A)

---

### France

Country Code: **FR**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46)**

country FR: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Hong Kong

Country Code: **HK**

Vaild Channels: 

---

### Singapore

Country Code: **SG**

Vaild Channels: 

---

### Taiwan

Country Code: **TW**

Vaild Channels: 

---

### Brazil

Country Code: **BR**

Vaild Channels: 

---

### Isreal

Country Code: **IL**

Vaild Channels: 

---

### Saudi Arabia

Country Code: **SA**

Vaild Channels: 

---

### Lebanon

Country Code: **LB**

Vaild Channels: 

---

### UAE

Country Code: **AE**

Vaild Channels: 

---

### South Africa

Country Code: **ZA**

Vaild Channels: 

---

### Argentina

Country Code: **AR**

Vaild Channels: 

---

### Australia

Country Code: **AU**

Vaild Channels: 

---

### Austria

Country Code: **AT**

Vaild Channels: 

---

### Bolivia

Country Code: **BO**

Vaild Channels: 

---

### Chile

Country Code: **CL**

Vaild Channels: 

---

### Greece

Country Code: **GR**

Vaild Channels: 

---

### Iceland

Country Code: **IS**

Vaild Channels: 

--- 

### India

Country Code: **IN**

Vaild Channels: 

---

### Ireland

Country Code: **IE**

Vaild Channels: 

---

### Kuwait

Country Code: **KW**

Vaild Channels: 

---

### Liechtenstein

Country Code: **LI**

Vaild Channels: 

---

### Lithuania

Country Code: **LT**

Vaild Channels: 

---

### Mexico

Country Code: **MX**

Vaild Channels: 

---

### Morocco

Country Code: **MA**

Vaild Channels: 

---

### New Zealand

Country Code: **NZ**

Vaild Channels: 

---

### Poland

Country Code: **PL**

Vaild Channels: 

---

### Puerto Rico

Country Code: **PR**

Vaild Channels: 

---

### Slovakia

Country Code: **SK**

Vaild Channels: 

---

### Slovenia

Country Code: **SI**

Vaild Channels: 

---

### Thailand

Country Code: **TH**

Vaild Channels: 

---

### Uruguay

Country Code: **UY**

Vaild Channels: 

---

### Panama

Country Code: **PA**

Vaild Channels: 

---

### Russia

Country Code: **RU**

Vaild Channels: **36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)**

country RU: DFS-ETSI

- (2402 - 2482 @ 40), (N/A, 20), (N/A)
- (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
- (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
- (5650 - 5730 @ 80), (N/A, 30), (0 ms), DFS
- (5735 - 5835 @ 80), (N/A, 30), (N/A)
- (57000 - 66000 @ 2160), (N/A, 40), (N/A)

---

### Egypt

Country Code: **EG**

Vaild Channels: 

---

### Trinidad and Tobago

Country Code: **TT**

Vaild Channels: 

---

### Turkey

Country Code: **TR**

Vaild Channels: 

---

### Costa Rica

Country Code: **CR**

Vaild Channels: 

---

### Ecuador

Country Code: **EC**

Vaild Channels: 

---

### Honduras

Country Code: **HN**

Vaild Channels: 

---

### Kenya

Country Code: **KE**

Vaild Channels: 

---

### Ukraine

Country Code: **UA**

Vaild Channels: 

---

### Vietnam

Country Code: **VN**

Vaild Channels: 

---

### Bulgaria

Country Code: **BG**

Vaild Channels: 

---

### Cyprus

Country Code: **CY**

Vaild Channels: 

---

### Estonia

Country Code: **EE**

Vaild Channels: 

---

### Mauritius

Country Code: **MU**

Vaild Channels: 

---

### Romania

Country Code: **RO**

Vaild Channels: 

---

### Serbia / Montenegro

Country Code: **CS**

Vaild Channels: 

---

### Indonesia

Country Code: **ID**

Vaild Channels: 

---

### Peru

Country Code: **PE**

Vaild Channels: 

---

### Venezuela

Country Code: **VE**

Vaild Channels: 

---

### Jamaica

Country Code: **JM**

Vaild Channels: 

---

### Bahrain

Country Code: **BH**

Vaild Channels: 

---

### Oman

Country Code: **OM**

Vaild Channels: 

---

### Jordan

Country Code: **JO**

Vaild Channels: 

---

### Bermuda

Country Code: **BM**

Vaild Channels: 

---

### Columbia

Country Code: **CO**

Vaild Channels: 

---

### Dominican Replublic

Country Code: **DO**

Vaild Channels: 

---

### Gutaemala

Country Code: **GT**

Vaild Channels: 

---

### Philippines

Country Code: **PH**

Vaild Channels: 

---

### Sri Lanka

Country Code: **LK**

Vaild Channels: 

---

### El Salvador

Country Code: **SV**

Vaild Channels: 

---

### Tunisia

Country Code: **TN**

Vaild Channels: 

---

### Pakistan

Country Code: **PK**

Vaild Channels: 

---

### Qatar

Country Code: **QA**

Vaild Channels: 

---

### Algeria

Country Code: **DZ**

Vaild Channels: 
