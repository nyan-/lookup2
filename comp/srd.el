;;; srd.el --- complement file for $B!X%i%s%@%`%O%&%91Q8l<-E5!Y(B
;; Copyright (C) 1999 Lookup Development Team <lookup@ring.gr.jp>

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software Foundation,
;; Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

;;; Code:

(require 'lookup)

(define-charset nil 'iso10646 [2 96 1 0 ?z 0 "iso10646" "iso10646" "iso10646"])

(define-ccl-program ccl-encode-iso10646-font
  '(0
    (
     (r1 -= 32)
     (r2 -= 32)
     (r1 *= 96)
     (r2 += (r1 % 256))
     (r1 /= 256)
    ))
  "CCL program to display iso10646 font")

(mapcar
 (lambda 
   (fontset)
   (set-fontset-font
    fontset 'iso10646
    "-gnu-unifont-medium-r-normal--16-160-75-75-c-80-iso10646-1"
    ))
   (fontset-list))

(setq font-ccl-encoder-alist
      (cons (cons "iso10646" ccl-encode-iso10646-font)
            font-ccl-encoder-alist))

(defun get-g (font code)
  (char-to-string
   (make-char font
	      (+ 32 (/ code 96))
	      (+ 32 (% code 96)))))

(defconst srd-gaiji-table
  (lookup-new-gaiji-table
   '(("G0-2f" "/") ("G0-3a" ":") ("G0-3d" "=") ("G0-75" "u") ("G0-83" "#f")
     ("G0-85" "<&u:2026>") ("G0-8a" "<&u:0160>") ("G0-8c" "<&u:0152>") ("G0-93" "$B!H(B")
     ("G0-94" "$B!I(B") ("G0-9c" "<&u:0153>") ("G0-a3" "<&u:00A3>") ("G0-a9" "<&u:00A9>")
     ("G0-ae" "<&u:00AE>") ("G0-b0" "<&u:00B0>") ("G0-b4" "<&u:00B4>") ("G0-b5" "<&u:00B5>")
     ("G0-b7" "<&u:00B7>") ("G0-b8" "<&u:00B8>") ("G0-bc" "<&u:00BC>") ("G0-bd" "<&u:00BD>")
     ("G0-be" "<&u:00BE>") ("G0-bf" "<&u:00BF>") ("G0-c0" "<&u:00c0>") ("G0-c1" "<&u:00c1>")
     ("G0-c2" "<&u:00c2>") ("G0-c4" "<&u:00c4>") ("G0-c5" "<&u:00c5>") ("G0-c6" "<&u:00c6>")
     ("G0-c7" "<&u:00c7>") ("G0-c8" "<&u:00c8>") ("G0-c9" "<&u:00c9>") ("G0-ca" "<&u:00ca>")
     ("G0-cc" "<&u:00cc>") ("G0-cd" "<&u:00cd>") ("G0-ce" "<&u:00ce>") ("G0-d0" "<&u:00d0>")
     ("G0-d2" "<&u:00d2>") ("G0-d3" "<&u:00d3>") ("G0-d6" "<&u:00d6>") ("G0-d9" "<&u:00d9>")
     ("G0-da" "<&u:00da>") ("G0-dc" "<&u:00dc>") ("G0-dd" "<&u:00dd>") ("G0-df" "<&u:00df>")
     ("G0-e0" "<&u:00e0>") ("G0-e1" "<&u:00e1>") ("G0-e2" "<&u:00e2>") ("G0-e3" "<&u:00e3>")
     ("G0-e4" "<&u:00e4>") ("G0-e5" "<&u:00e5>") ("G0-e6" "<&u:00e6>") ("G0-e7" "<&u:00e7>")
     ("G0-e8" "<&u:00e8>") ("G0-e9" "<&u:00e9>") ("G0-ea" "<&u:00ea>") ("G0-eb" "<&u:00eb>")
     ("G0-ec" "<&u:00ec>") ("G0-ed" "<&u:00ed>") ("G0-ee" "<&u:00ee>") ("G0-ef" "<&u:00ef>")
     ("G0-f0" "<&u:00f0>") ("G0-f1" "<&u:00f1>") ("G0-f2" "<&u:00f2>") ("G0-f3" "<&u:00f3>")
     ("G0-f4" "<&u:00f4>") ("G0-f5" "<&u:00f5>") ("G0-f6" "<&u:00f6>") ("G0-f9" "<&u:00f9>")
     ("G0-fa" "<&u:00fa>") ("G0-fb" "<&u:00fb>") ("G0-fc" "<&u:00fc>") ("G0-fd" "<&u:00fd>")
     ("G0-fe" "<&u:00fe>") ("G0-ff" "<&u:00ff>") ("G1-41" "<&u:0251>") ("G1-42" "<&u:0254>")
     ("G1-43" "<&u:028c><&u:0301>") ("G1-4a" "<&u:01fd>") ("G1-4b" "<&u:00E6><&u:0300>") ("G1-4c" "<&u:0259><&u:0301>")
     ("G1-4d" "<&u:0259><&u:0300>") ("G1-4e" "<&u:0251><&u:0301>") ("G1-4f" "<&u:0251><&u:0300>") ("G1-50" "<&u:0283>")
     ("G1-51" "<&u:0254><&u:0301>") ("G1-52" "<&u:0254><&u:0300>") ("G1-53" "<&u:025B><&u:0301>") ("G1-54" "<&u:025B><&u:0300>")
     ("G1-57" "<&u:01e3>") ("G1-58" "<&u:0113>") ("G1-59" "<&u:012B>") ("G1-5a" "<&u:016B>")
     ("G1-5b" "<&u:014D>") ("G1-5c" "<&u:0101>") ("G1-5d" "<&u:0100>") ("G1-5e" "<&u:0233>")
     ("G1-5f" "<&u:004E><&u:0304>") ("G1-60" "<&u:0072><&u:0304>") ("G1-61" "<&u:0252>") ("G1-62" "<&u:0268><&u:0301>")
     ("G1-63" "<&u:0268>") ("G1-64" "<&u:0111>") ("G1-65" "<&u:0251><&u:0303>") ("G1-66" "<&u:014C>")
     ("G1-67" "<&u:006E><&u:0303>") ("G1-68" "<&u:016A>") ("G1-6a" "<&u:03B8>") ("G1-71" "<&u:03B8><&u:0301>")
     ("G1-72" "<&u:03B8><&u:0300>") ("G1-73" "<&u:0292>") ("G1-76" "<&u:014b>") ("G1-78" "<&u:0072><&u:0300>")
     ("G1-7a" "<&u:1EF3>") ("G1-7d" "<&u:01ff>") ("G1-7e" "<&u:00f8><&u:0300>") ("G1-80" "<&u:0112>")
     ("G1-81" "<&u:012A>") ("G1-86" "<&u:025b>") ("G1-88" "<&u:1EF2>") ("G1-89" "<&u:0272>")
     ("G1-8a" "<&u:0101>") ("G1-8b" "<&u:0042><&u:0300>") ("G1-8c" "<&u:0106>") ("G1-92" "<&u:0129>")
     ("G1-93" "<&u:00EE>") ("G1-94" "<&u:00D4>") ("G1-95" "<&u:0103>") ("G1-96" "<&u:011F>")
     ("G1-97" "<&u:012D>") ("G1-98" "<&u:0115>") ("G1-99" "<&u:016D>") ("G1-9a" "<&u:014F>")
     ("G1-9b" "<&u:0073><&u:0306>") ("G1-9c" "<&u:0063><&u:0306>") ("G1-9d" "<&u:0177>") ("G1-9e" "<&u:011D>")
     ("G1-9f" "<&u:0251><&u:0303>") ("G1-a0" "<&u:0070><&u:0303>") ("G1-a3" "<&u:0175>") ("G1-a5" "<&u:0077><&u:0303>")
     ("G1-a6" "<&u:0078><&u:0303>") ("G1-a7" "<&u:0058><&u:0301>") ("G1-a8" "<&u:0043><&u:0303>") ("G1-a9" "<&u:0250>")
     ("G1-ac" "<&u:016D>") ("G2-67" "[$B%?%$(B]") ("G1-ae" "<&u:0103>") ("G1-b4" "<&u:0076><&u:0325>")
     ("G1-b6" "<&u:017C>") ("G1-b7" "$B".(B") ("G1-b8" "-") ("G1-b9" "<&u:1E0F>")
     ("G1-ba" "<&u:1E5F>") ("G1-bc" "i/") ("G1-c1" "<&u:0169>") ("G1-c3" "<&u:028E>")
     ("G1-c4" "<&u:1E41>") ("G1-c5" "<&u:1E45>") ("G1-c6" "<&u:0117>") ("G1-c7" "<&u:1E92>")
     ("G1-cd" "<&u:006C><&u:0324>") ("G1-ce" "<&u:0072><&u:0324>") ("G1-cf" "<&u:0159>") ("G1-d0" "<&u:01F0>")
     ("G1-d2" "<&u:011B>") ("G1-d3" "<&u:0161>") ("G1-d4" "<&u:01CE>") ("G1-d5" "<&u:010D>")
     ("G1-d6" "<&u:01CF>") ("G1-d7" "<&u:010C>") ("G1-d8" "<&u:0148>") ("G1-e0" "<&u:006F><&u:0304><&u:0301>") ("G1-e1" "($B%?%V!<(B)")
     ("G1-e5" "<&u:1E17>") ("G1-e6" "<&u:25BE>") ("G1-eb" "<&u:015B>") ("G1-ec" "<&u:00ED><&u:02D9>")
     ("G1-ed" "#Q") ("G1-ee" "<&u:0155>") ("G1-ef" "<&u:1E31>") ("G1-f2" "<&u:1E63>")
     ("G1-f4" "<&u:0251><&u:0304><&u:0301>") ("G1-f5" "<&u:012B><&u:0301>") ("G1-f6" "<&u:0113><&u:0301>") ("G1-f7" "<&u:016B><&u:0301>")
     ("G1-fc" "<&u:1E4D>") ("G2-40" "<&u:0141>") ("G2-43" "<&u:0142>") ("G2-44" "<&u:026B>")
     ("G2-48" "<&u:0273>") ("G2-49" "<&u:0276><&u:0301>") ("G2-4a" "<&u:0276><&u:0300>") ("G2-4b" "#i/")
     ("G2-52" "aa$B!1(B") ("G2-54" "#M") ("G2-55" "<&u:015F>") ("G2-5f" "<&u:0163>")
     ("G2-62" "<&u:0048><&u:0323>") ("G2-63" "<&u:0068><&u:0323>") ("G2-64" "<&u:2627>") ("G2-65" "<&u:01D2>")
     ("G2-66" "<&u:1E6D>") ("G2-67" "[$B%?%$(B]") ("G2-75" "<&u:0251><&u:0308>") ("G2-79" "<&u:1E0D>")
     ("G2-7a" "<&u:0073><&u:0325>") ("G2-7c" "<&u:1E0C>") ("G2-7d" "<&u:01FF>") ("G2-81" "[$B%@%k%;!<%K%g(B]")
     ("G2-8a" "<&u:0105>") ("G2-8d" "[$B%@%V%k%7%c!<%W(B]") ("G2-95" "E|") ("G2-97" "<&u:0127>")
     ("G2-98" "<&u:0064><&u:0325>") ("G2-9e" "[$B%U%'%k%^!<%?(B]") ("G2-9f" "[$B5U%U%'%k%^!<%?(B]")
     ("G2-a1" "[$B"*(B]") ("G2-ab" "<&u:0281>") ("G2-af" "[10^10^100]") ("G2-b4" "<&u:0281>")
     ("G2-b5" "<&u:025f>") ("G2-b8" "<&u:02C7>") ("G2-bd" "<&u:006D><&u:0325>") ("G2-be" "<&u:006F><&u:02D9>")
     ("G2-c2" "<&u:1E2F>") ("G2-c6" "<&u:007A><&u:0300>") ("G2-c8" "<&u:0051><&u:0300>") ("G2-c9" "<&u:266A>")
     ("G2-cb" "<&u:00FC>") ("G2-cc" "<&u:02C8>") ("G2-cd" "[$B%k!<%H(B-1]") ("G2-ce" "<&u:1E6C>")
     ("G2-cf" "[n$B>h:,(B]") ("G2-d0" "<&u:203D>") ("G2-e1" "<&u:028c><&u:0300>") ("G2-e4" "$B"'(B")
     ("G2-e9" "<&u:017A>") ("G2-eb" "<&u:006D><&u:0300>") ("G2-f0" "<&u:006D><&u:0300>"
G2-f0	=  "<&u:0070><&u:0300>") ("G2-f1" "#12")
     ("G2-f9" "<&u:2127>") ("G2-fb" "<&u:004D><&u:0304>") ("G3-40" "<&u:0077><&u:0303>") ("G3-41" "<&u:1E93>")
     ("G3-44" "<&u:266E>") ("G3-45" "<&u:0117><&u:0301>") ("G3-46" "i/$B!-(B") ("G3-4f" "<&u:2197>")
     ("G3-50" "<&u:2198>") ("G3-52" "(P)") ("G3-5f" "<&u:0250><&u:0303><&u:0301>") ("G3-63" "<&u:1E15>")
     ("G3-66" "<&u:01C5>") ("G3-67" "<&u:0065><&u:0303><&u:0301>") ("G3-69" "<&u:012B><&u:0301>") ("G3-75" "<&u:015A>")
     ("G3-76" "<&u:0254><&u:0303><&u:0301>") ("G3-77" "<&u:028C>") ("G3-79" "<&u:1E62>") ("G3-84" "[a+b$B!1(B]")
     ("G3-88" "<&u:00EF>") ("G3-89" "<&u:1EC7>") ("G3-8a" "$B".(B") ("G3-8c" "<&u:01E7>")
     ("G3-8d" "[$B%k!<%H(B2Rr]") ("G3-91" "<&u:1E37>") ("G3-9a" "<&u:042F>") ("G3-9b" "<&u:0287>")
     ("G3-9c" "<&u:012B>") ("G3-9d" "<&u:028C><&u:0303><&u:0301>") ("G3-9f" "<&u:0289><&u:0301>") ("G3-a0" "$B"O(B")
     ("G3-a3" "<&u:1ED9>") ("G3-a4" "<&u:0251><&u:0302><&u:0323>") ("G3-a8" "<&u:00F3>") ("G3-aa" "#ye1")
     ("G3-ab" "#ye2") ("G3-b9" "<&u:0259>") ("G3-ba" "<&u:2194>") ("G3-bc" "$B&A!-(B")
     ("G3-bd" "<&u:1E47>") ("G3-be" "<&u:1E5B>") ("G3-bf" "<&u:0070><&u:02D9>") ("G3-c1" "<&u:025b><&u:0303>")
     ("G3-c2" "<&u:1E05>") ("G3-c3" "<&u:006B><&u:02D9>") ("G3-c4" "<&u:0107>") ("G3-c5" "<&u:1E43>")
     ("G3-c6" "<&u:0065><&u:02D9>") ("G3-ca" "<&u:0044><&u:0301>") ("G3-cb" "<&u:0054><&u:0301>") ("G3-cc" "<&u:0050><&u:0300>")
     ("G3-cd" "<&u:0154>") ("G3-ce" "<&u:004E><&u:0300>") ("G3-cf" "<&u:0251><&u:0304><&u:0301>") ("G3-d3" "<&u:01F5>")
     ("G3-d4" "<&u:0051><&u:0301>") ("G3-d5" "<&u:0053><&u:0304><&u:0301>") ("G3-d6" "<&u:004D><&u:0300>") ("G3-d7" "<&u:1E54>")
     ("G3-d8" "<&u:0233><&u:0301>") ("G3-d9" "<&u:0056><&u:0301>") ("G3-da" "<&u:0143>") ("G3-db" "<&u:0042><&u:0301>")
     ("G3-dc" "<&u:0048><&u:0301>") ("G3-dd" "<&u:004A><&u:0301>") ("G3-de" "<&u:1E3E>") ("G3-e1" "<&u:0250><&u:0301>")
     ("G3-e5" "<&u:1E33>") ("G3-e6" "<&u:0251><&u:02D9>") ("G3-e7" "<&u:0032><&u:0300>") ("G3-e8" "<&u:0031><&u:0301>")
     ("G3-e9" "<&u:0046><&u:0301>") ("G3-ea" "<&u:1E30>") ("G3-eb" "<&u:0037><&u:0301>") ("G3-ec" "<&u:0139>")
     ("G3-ed" "<&u:1E82>") ("G3-ee" "<&u:00F3><&u:02D9>") ("G3-ef" "<&u:0032><&u:0301>") ("G3-f0" "<&u:0033><&u:0301>")
     ("G3-f1" "<&u:0039><&u:0301>") ("G3-f3" "<&u:0034><&u:0301>") ("G3-f4" "<&u:0251><&u:0301><&u:02D9>") ("G3-f6" "<&u:0036><&u:0301>")
     ("G3-f7" "<&u:0038><&u:0301>") ("G3-f9" "<&u:0074><&u:0301>") ("G3-fa" "<&u:0078><&u:0301>") ("G3-fb" "<&u:1E3F>")
     ("G4-0f" "$B!T(B") ("G4-40" "<&u:0071><&u:0300>") ("G4-41" "<&u:0078><&u:0300>") ("G4-42" "<&u:0043><&u:0300>")
     ("G4-43" "<&u:005A><&u:0300>") ("G4-44" "<&u:017D>") ("G4-45" "<&u:0056><&u:0300>") ("G4-46" "<&u:0054><&u:0300>")
     ("G4-47" "<&u:0047><&u:0300>") ("G4-48" "<&u:004A><&u:0300>") ("G4-49" "<&u:006B><&u:0300>") ("G4-4a" "<&u:0046><&u:0300>")
     ("G4-4b" "<&u:00CC>") ("G4-4c" "<&u:0179>") ("G4-4d" "<&u:004C><&u:0300>") ("G4-4e" "<&u:1E55>")
     ("G4-4f" "<&u:0044><&u:0300>") ("G4-50" "<&u:0053><&u:0300>") ("G4-51" "<&u:0052><&u:0300>") ("G4-52" "<&u:0062><&u:0301>")
     ("G4-53" "<&u:0048><&u:0300>") ("G4-54" "<&u:1E80>") ("G4-56" "<&u:01DD><&u:0308>") ("G4-57" "<&u:01F4>")
     ("G4-59" "<&u:0144>") ("G4-5b" "<&u:0064><&u:0301>") ("G4-5c" "<&u:0254><&u:0303>") ("G4-5e" "<&u:0250><&u:0303>")
     ("G4-5f" "<&u:0066><&u:0301>") ("G4-60" "i") ("G4-61" "<&u:0153><&u:0303>") ("G4-62" "<&u:00E6><&u:0303>")
     ("G4-64" "Cg~") ("G4-66" "<&u:0125>") ("G4-67" "<&u:00B5><&u:02D9>") ("G4-6c" "<&u:221A>")
     ("G4-6f" "<&u:006B><&u:02B7>") ("G4-72" "[s(s-a)(s-b)(s-c)$B$NJ?J}:,(B]") ("G4-77" "<&u:02d0>")
     ("G4-79" "<&u:0131><&u:02D9>") ("G4-88" "<&u:21C0>") ("G4-89" "$B"*(B") ("G4-8a" "[$B%k!<%H(B2]")
     ("G4-8b" "[Et]") ("G4-8e" "<&u:2153>") ("G4-90" "<&u:215B>") ("G4-91" "<&u:215C>")
     ("G4-92" "<&u:215D>") ("G4-93" "<&u:215E>") ("G4-95" "3/16") ("G4-96" "7/16")
     ("G4-97" "5/10") ("G4-98" "11/32") ("G4-99" "<&u:2156>") ("G4-9a" "<&u:2154>")
     ("G4-9b" "$B"+(B") ("G4-9d" "$B"*(B") ("G4-9f" "$B!T(B") ("G4-a0" "$B!U(B")
     ("G4-a1" "$B!L(B") ("G4-a2" "$B!M(B") ("G5-49" "<&u:026A>") ("G5-52" "<&u:0280>")
     ("G5-53" "S") ("G5-54" "T") ("G5-55" "U") ("G5-56" "V") ("G5-58" "X")
     ("G5-59" "Y") ("G5-5d" "<&u:00D8>") ("G5-60" "<&u:00C0>") ("G5-61" "<&u:00C2>")
     ("G5-6a" "E") ("G5-70" "<&u:00CD>") ("G5-75" "<&u:00D1>") ("G5-76" "<&u:00D6>")
     ("G5-80" "<&u:00DC>") ("G5-81" "<&u:00DA>") ("G5-83" "<&u:00D9>") ("G5-84" "<&u:00DB>")
     ("G5-85" "<&u:016A>") ("G5-88" "<&u:017D>") ("G5-89" "<&u:010C>") ("G5-8a" "<&u:0106>")
     ("G6-40" "<&u:6963>") ("G6-41" "<&u:75e4>") ("G6-42" "<&u:766d>")
     ("G6-43" "<&u:70bb>") ("G6-44" "<&u:68a3>") ("G6-45" "[$Bgg;T(B]")
     ("G6-46" "<&u:579c>") ("G6-47" "<&u:6798>") ("G6-48" "<&u:698d>")
     ("G6-49" "<&u:76b6>") ("G6-4a" "<&u:685b>") ("G6-4b" "<&u:57f5>")
     ("G6-4c" "<&u:7664>") ("G6-4d" "<&u:7146>") ("G6-4e" "<&u:8dd7>")
     ("G6-4f" "<&u:587c>") ("G6-50" "<&u:9b5e>") ("G6-51" "<&u:6ec7>")
     ("G6-52" "<&u:7fee>") ("G6-53"  "<&u:8532>") ("G6-54" "<&u:9ab6>")
     ("G6-55" "<&u:7aa0>") ("G6-56" "<&u:9ac1>") ("G6-57" "[$B;D(B+$B1](B-$B;7(B]")
     ("G6-58" "<&u:7d47>") ("G6-59" "<&u:837d>") ("G6-5a" "<&u:55c9>")
     ("G6-5b" "<&u:7b2f>") ("G6-5c" "<&u:9f70>") ("G6-5d" "<&u:7619>")
     ("G6-5e" "<&u:9127>") ("G6-5f" "<&u:744b>") ("G6-60" "<&u:5257>")
     ("G6-61" "<&u:5212>") ("G6-62" "[$B6bDL(B]") ("G6-63" "<&u:5676>")
     ("G6-64" "<&u:87a0>") ("G6-65" "<&u:4e22>") ("G6-66" "<&u:762d>")
     ("G6-67" "<&u:8641>") ("G6-68" "<&u:9bb8>") ("G6-69" "<&u:9b10>")
     ("G6-6a" "<&u:95a9>") ("G6-6b" "<&u:9134>") ("G6-6c" "<&u:5e2e>")
     ("G6-6d" "<&u:7868>") ("G6-6e" "<&u:78f2>") ("G6-6f" "<&u:6677>")
     ("G6-70" "<&u:65C8>") ("G6-71" "<&u:560e>") ("G6-72" "<&u:729b>")
     ("G6-73" "<&u:58a9>") ("G6-74" "<&u:9d32>") ("G6-75" "<&u:7447>")
     ("G6-76" "<&u:99c3>") ("G6-77" "<&u:9a20>") ("G6-78" "<&u:74e4>")
     ("G6-79" "<&u:6c74>") ("G6-7a" "<&u:7095>") ("G6-7b" "<&u:8a22>")
     ("G6-7c" "<&u:7d3d>") ("G6-7d" "<&u:7c0e>") ("G6-7e" "<&u:53b4>")
     ("G6-80" "<&u:8e95>") ("G6-81" "<&u:6f33>") ("G6-82" "<&u:96de>")
     ("G6-83" "<&u:9239>") ("G6-84" "<&u:73a2>") ("G6-85" "<&u:8611>")
     ("G6-86" "<&u:9095>") ("G6-87" "<&u:5aa7>") ("G6-88" "<&u:5535>")
     ("G6-89" "<&u:9b9e>") ("G6-8a" "<&u:869c>") ("G6-8b" "<&u:8dd1>")
     ("G6-8c" "<&u:62fc>") ("G6-8d" "<&u:7a03>") ("G6-8e" "<&u:9eac>")
     ("G6-8f" "[$B?3(B+$B9Y(B+$B8r(B]") ("G6-90" "<&u:9df4>") ("G6-91" "<&u:7fe8>")
     ("G6-92" "[$BLZ:s(B]") ("G6-93" "<&u:9371>") ("G6-94" "<&u:8932>")
     ("G6-95" "<&u:82c6>") ("G6-96" "<&u:8dc6>") ("G6-97" "<&u:6ff0>")
     ("G6-98" "<&u:766e>") ("G6-99" "<&u:911e>") ("G6-9a" "<&u:6c85>")
     ("G6-9b" "<&u:728e>") ("G6-9c" "<&u:6f33>") ("G6-9d" "<&u:6dc4>")
     ("G6-9e" "<&u:6bad>") ("G6-9f" "[$B%O!&(B]")
     ("G9-23" "#") ("G9-2f" "/") ("G9-3c" "<") ("G9-3d" "$B!F(B")
     ("G9-3e" ">") ("G9-5c" "[aa$B!1(B]") ("G9-5e" "<&u:010C>") ("G9-5f" "<&u:0048><&u:0323>")
     ("G9-60" "<&u:0141>") ("G9-7b" "<&u:042F>") ("G9-7c" "<&u:1E6C>") ("G9-7d" "<&u:1E90>")
     ("G9-7e" "<&u:0101>") ("G9-82" "<&u:0103>") ("G9-83" "<&u:0105>") ("G9-85" "<&u:2026>")
     ("G9-86" "c") ("G9-87" "d") ("G9-88" "<&u:0113>") ("G9-89" "<&u:011B>")
     ("G9-8a" "<&u:0119>") ("G9-8b" "<&u:01E7>") ("G9-8c" "<&u:011F>") ("G9-91" "<&u:1E25>")
     ("G9-92"  "<&u:012B>") ("G9-93" "$B!H(B") ("G9-94" "$B!I(B") ("G9-95" "<&u:0129>")
     ("G9-96" "<&u:0142>") ("G9-97" "<&u:0148>") ("G9-98" "<&u:01D2>") ("G9-99" "<&u:014D>")
     ("G9-9a" "<&u:00F8>") ("G9-9b" "<&u:0159>") ("G9-9c" "<&u:0161>") ("G9-9f" "<&u:015F>")
     ("G9-a1" "<&u:1E63>") ("G9-a2" "<&u:0163>") ("G9-a3" "$B!r(B") ("G9-a4" "<&u:1E6D>")
     ("G9-a6" "<&u:0169>") ("G9-a7" "<&u:016B>") ("G9-a8" "<&u:016D>") ("G9-a9" "<&u:016F>")
     ("G9-aa" "<&u:016B><&u:0301>") ("G9-ab" "<&u:1E93>") ("G9-ac" "<&u:01C5>") ("G9-ad" "-")
     ("G9-ae" "<&u:00B0>") ("G9-af" "$B!m(B") ("G9-b0" "<&u:03B8>") ("G9-b1" "<&u:03C7>")
     ("G9-b2" "<&u:01D0>") ("G9-b7" "$B!o(B") ("G9-bd" "<&u:00DB>") ("G9-be" "<&u:0160>")
     ("G9-bf" "<&u:00BF>") ("G9-c0" "<&u:00C0>") ("G9-c1" "<&u:00C1>") ("G9-c5" "<&u:00C5>")
     ("G9-c6" "<&u:00C6>") ("G9-c7" "<&u:00C7>") ("G9-c8" "<&u:00C8>") ("G9-c9" "<&u:00C9>")
     ("G9-cc" "<&u:00CC>") ("G9-cd" "<&u:00CD>") ("G9-ce" "<&u:00CE>") ("G9-d2" "<&u:00D2>")
     ("G9-d3" "<&u:00D3>") ("G9-d6" "<&u:00D6>") ("G9-d7" "<&u:00D7>") ("G9-d9" "<&u:00D9>")
     ("G9-da" "<&u:00DA>") ("G9-dc" "<&u:00DC>") ("G9-dd" "<&u:00DD>") ("G9-df" "<&u:00df>")
     ("G9-e0" "<&u:00e0>") ("G9-e1" "<&u:00e1>") ("G9-e2" "<&u:00e2>") ("G9-e3" "<&u:00e3>") 
     ("G9-e4" "<&u:00e4>") ("G9-e5" "<&u:00e5>") ("G9-e6" "<&u:00e6>") ("G9-e7" "<&u:00e7>")
     ("G9-e8" "<&u:00e8>") ("G9-e9" "<&u:00e9>") ("G9-ea" "<&u:00ea>") ("G9-eb" "<&u:00eb>")
     ("G9-ec" "<&u:00ec>") ("G9-ed" "<&u:00ed>") ("G9-ee" "<&u:00ee>") ("G9-ef" "<&u:00ef>")
     ("G9-f1" "<&u:00f1>") ("G9-f2" "<&u:00f2>") ("G9-f3" "<&u:00f3>") ("G9-f4" "<&u:00f4>")
     ("G9-f5" "<&u:00f5>") ("G9-f6" "<&u:00f6>") ("G9-f9" "<&u:00f9>") ("G9-fa" "<&u:00fa>")
     ("G9-fb" "<&u:00fb>") ("G9-fc" "<&u:00fc>") ("G9-fd" "<&u:00fd>") ("G9-ff" "<&u:00ff>"))))

(defun srd-arrange-structure (entry)
  (goto-char (point-min))
  (while (re-search-forward "<&u:\\([0-9A-Fa-f]+\\)>" nil t)
    (let* ((ucsnum (string-to-int (match-string 1) 16))
	   (ucschar (save-match-data (ucs-to-char ucsnum))))
      (if ucschar (replace-match (char-to-string ucschar))
	(replace-match (get-g 'iso10646 ucsnum))
	)))
  (goto-char (point-min))
  (if (looking-at "$B""(B ")
      (delete-region (match-beginning 0) (match-end 0)))
  (if (looking-at "[^\[\n]*")
      (lookup-make-region-heading (match-beginning 0) (match-end 0) 1))
  (while (re-search-forward "^[ $B"#(B].*\n" nil t)
    (lookup-make-region-heading (match-beginning 0) (match-end 0)
				(if (eq (char-after (match-beginning 0)) ? )
				    6 2)))
  )

(setq lookup-complement-options
      (list ':arrange-table '((structure . srd-arrange-structure))
	    ':gaiji-regexp "<\\(G[0-9]-[0-9a-f][0-9a-f]\\)>"
	    ':gaiji-table srd-gaiji-table))

;;; srd.el ends here
