totintcups(req);
 new res,club
 S club=""
 S cnt=0
 F  S club=$O(^Football(club)) Q:club=""  D
 . set cnt=cnt+1
 . set res(cnt,"club")=club
 . set res(cnt,"Total_International_Cups")=$TR(^Football(club,"UEFAC"),$C(13),"")
 QUIT $$response^%zmgweb(.res)
totintScups(req);
 new res,club
 S club=""
 S cnt=0
 F  S club=$O(^Football(club)) Q:club=""  D
 . set cnt=cnt+1
 . set res(cnt,"club")=club
 . set res(cnt,"Total_International_Super_Cups")=$TR(^Football(club,"UEFASC"),$C(13),"")
 QUIT $$response^%zmgweb(.res)
totinthons(req);
 new res,club
 S club=""
 S cnt=0
 F  S club=$O(^Football(club)) Q:club=""  D
 . set cnt=cnt+1
 . set res(cnt,"club")=club
 . set res(cnt,"Total_International_honours")=$TR(^Football(club,"UEFAT"),$C(13),"")
 QUIT $$response^%zmgweb(.res)
totdomintcups(req);
 new res,club
 S club=""
 S cnt=0
 F  S club=$O(^Football(club)) Q:club=""  D
 . set cnt=cnt+1
 . set res(cnt,"club")=club
 . set res(cnt,"Total_Domestic_and_International_Cups")=$TR(^Football(club,"TotC"),$C(13),"")
 QUIT $$response^%zmgweb(.res)
totdomintleagues(req);
 new res,club
 S club=""
 S cnt=0
 F  S club=$O(^Football(club)) Q:club=""  D
 . set cnt=cnt+1
 . set res(cnt,"club")=club
 . set res(cnt,"Total_Domestic_and_International_Leagues")=$TR(^Football(club,"TotL"),$C(13),"")
 QUIT $$response^%zmgweb(.res)
totcups(req);
 new res,club
 S club=""
 S cnt=0
 F  S club=$O(^Football(club)) Q:club=""  D
 . set cnt=cnt+1
 . set res(cnt,"club")=club
 . set res(cnt,"Total_Cups_Leagues")=$TR(^Football(club,"TotTot"),$C(13),"")
 QUIT $$response^%zmgweb(.res)
totdomleagues(req);
 new res,club
 S club=""
 S cnt=0
 F  S club=$O(^Football(club)) Q:club=""  D
 . set cnt=cnt+1
 . set res(cnt,"club")=club
 . set res(cnt,"Domestic_Leagues")=$TR(^Football(club,"DomL"),$C(13),"")
 QUIT $$response^%zmgweb(.res)
totdomcups(req);
 new res,club
 S club=""
 S cnt=0
 F  S club=$O(^Football(club)) Q:club=""  D
 . set cnt=cnt+1
 . set res(cnt,"club")=club
 . set res(cnt,"Domestic_Cups")=$TR(^Football(club,"DomC"),$C(13),"")
 QUIT $$response^%zmgweb(.res)
totdomScups(req);
 new res,club
 S club=""
 S cnt=0
 F  S club=$O(^Football(club)) Q:club=""  D
 . set cnt=cnt+1
 . set res(cnt,"club")=club
 . set res(cnt,"Domestic_Super_Cups")=$TR(^Football(club,"DomSC"),$C(13),"")
 QUIT $$response^%zmgweb(.res)
totdomLC(req);
 new res,club
 S club=""
 S cnt=0
 F  S club=$O(^Football(club)) Q:club=""  D
 . set cnt=cnt+1
 . set res(cnt,"club")=club
 . set res(cnt,"Domestic_Leagues_and_Cups")=$TR(^Football(club,"DomT"),$C(13),"")
 QUIT $$response^%zmgweb(.res)
getcups(req)
 new res,club
 set club=$get(req("params","club"))
 ;
 if club="" do  QUIT $$errorResponse^%zmgweb(.errors)
 . set errors("error")="No club specified"
 ;
 S dat=$data(^Football(club))
 if dat="0" do  QUIT $$errorResponse^%zmgweb(.errors)
 . set errors("error")="Unable to identify a club with the specified club"
 ;
 set res("club")=club
 set res("FIFA/UEFA_Cups")=^Football(club,"UEFAC")
 set res("FIFA/UEFA_Super Cups")=^Football(club,"UEFASC")
 set res("FIFA/UEFA_Total")=^Football(club,"UEFAT")
 set res("Domestic_Leagues")=^Football(club,"DomL")
 set res("Domestic_Cups")=^Football(club,"DomC")
 set res("Domestic_Super_Cups")=^Football(club,"DomSC")
 set res("Domestic_Total")=^Football(club,"DomT")
 set res("Total_Leagues")=^Football(club,"TotL")
 set res("Total_Cups")=^Football(club,"TotC")
 set TotTot=$TR(^Football(club,"TotTot"),$C(13),"")
 set res("Total_Leagues_and_Cups")=TotTot
 QUIT $$response^%zmgweb(.res)