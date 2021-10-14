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

##Explaining hostapd 

- hw_mode=a Will set the interface to 5GHz
- country_code=CA Will set the interface to use that specific country code. Note this is required for 5GHz use.
- vht_oper_chwidth=0 Should be set to 0 as the RPI only supports 20MHz
- vht_oper_centr_freq_seg0_idx=0 Should be set to the index shown in () next to the channel number
- channel=0 Should be set to the channel number required

##Some Notes

1. DFS bandwidths should not be used as weather and radar have priority. If a DFS pulse is sent out, this will halt the wifi for the countries specific wait period. For example, 10s in Europe. 
2. Some bandwidths cannot be used outside. For example, for Canada, the 5150 - 5250 range is restricted to indoor use only. 
3. Some countries have the 5150 - 5250 & 5735 - 5835 bandwidths, whereas others only have the 5150 - 5250 bandwidths. 

## Country Codes with valid channels

United States        US    36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)
country US: DFS-FCC
	(2402 - 2472 @ 40), (N/A, 30), (N/A)
	(5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
	(5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
	(5490 - 5730 @ 160), (N/A, 23), (0 ms), DFS
	(5735 - 5835 @ 80), (N/A, 30), (N/A)
	(57240 - 63720 @ 2160), (N/A, 40), (N/A)
           
Canada               CA    36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)
country CA: DFS-FCC
	(2402 - 2472 @ 40), (N/A, 30), (N/A)
	(5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
	(5250 - 5350 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
	(5470 - 5600 @ 80), (N/A, 24), (0 ms), DFS
	(5650 - 5730 @ 80), (N/A, 24), (0 ms), DFS
	(5735 - 5835 @ 80), (N/A, 30), (N/A)
   
Japan                JP3   36(idx 38), 40(idx 38), 44(idx 46)
country JP: DFS-JP
	(2402 - 2482 @ 40), (N/A, 20), (N/A)
	(2474 - 2494 @ 20), (N/A, 20), (N/A), NO-OFDM
	(4910 - 4990 @ 40), (N/A, 23), (N/A)
	(5030 - 5090 @ 40), (N/A, 23), (N/A)
	(5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
	(5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
	(5490 - 5710 @ 160), (N/A, 23), (0 ms), DFS
	(59000 - 66000 @ 2160), (N/A, 10), (N/A)

Germany              DE
Netherlands          NL
Italy                IT 
Portugal             PT
Luxembourg           LU 
Norway               NO 
Finland              FI 
Denmark              DK
Switzerland          CH
Czech Republic       CZ 
Spain                ES
United Kingdom       GB

Korea                KR    36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)
country KR: DFS-JP
	(2402 - 2482 @ 40), (N/A, 13), (N/A)
	(5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
	(5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
	(5490 - 5710 @ 160), (N/A, 30), (0 ms), DFS
	(5735 - 5835 @ 80), (N/A, 30), (N/A)
	(57000 - 66000 @ 2160), (N/A, 43), (N/A)

China                CN    36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)
country CN: DFS-FCC
	(2402 - 2482 @ 40), (N/A, 20), (N/A)
	(5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
	(5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
	(5735 - 5835 @ 80), (N/A, 30), (N/A)
	(57240 - 59400 @ 2160), (N/A, 28), (N/A)
	(59400 - 63720 @ 2160), (N/A, 44), (N/A)
	(63720 - 65880 @ 2160), (N/A, 28), (N/A)

France               FR    36(idx 38), 40(idx 38), 44(idx 46)
country FR: DFS-ETSI
	(2402 - 2482 @ 40), (N/A, 20), (N/A)
	(5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
	(5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
	(5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
	(57000 - 66000 @ 2160), (N/A, 40), (N/A)

Hong Kong            HK
Singapore            SG
Taiwan               TW
Brazil               BR 
Israel               IL
Saudi Arabia         SA 
Lebanon              LB
UAE                  AE
South Africa         ZA
Argentina            AR 
Australia            AU 
Austria              AT
Bolivia              BO 
Chile                CL
Greece               GR 
Iceland              IS 
India                IN 
Ireland              IE 
Kuwait               KW
Liechtenstein        LI 
Lithuania            LT
Mexico               MX
Morocco              MA 
New Zealand          NZ 
Poland               PL
Puerto Rico          PR
Slovakia             SK
Slovenia             SI
Thailand             TH
Uruguay              UY
Panama               PA
Russia               RU    36(idx 38), 40(idx 38), 44(idx 46), 149(idx 151), 153(idx 151), 157(idx 159), 161(idx 159)
country RU: DFS-ETSI
	(2402 - 2482 @ 40), (N/A, 20), (N/A)
	(5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
	(5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
	(5650 - 5730 @ 80), (N/A, 30), (0 ms), DFS
	(5735 - 5835 @ 80), (N/A, 30), (N/A)
	(57000 - 66000 @ 2160), (N/A, 40), (N/A)
 
Egypt                EG
Trinidad and Tobago  TT
Turkey               TR 
Costa Rica           CR
Ecuador              EC
Honduras             HN
Kenya                KE
Ukraine              UA
Vietnam              VN
Bulgaria             BG
Cyprus               CY
Estonia              EE
Mauritius            MU
Romania              RO 
Serbia / Montenegro  CS
Indonesia            ID
Peru                 PE
Venezuela            VE 
Jamaica              JM 
Bahrain              BH
Oman                 OM
Jordan               JO 
Bermuda              BM
Colombia             CO
Dominican Republic   DO
Guatemala            GT
Philippines          PH
Sri Lanka            LK
El Salvador          SV
Tunisia              TN
Pakistan             PK
Qatar                QA 
Algeria              DZ