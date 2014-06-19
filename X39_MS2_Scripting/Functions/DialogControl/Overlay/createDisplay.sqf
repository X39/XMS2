#include "\X39_MS2_Scripting\default.hpp"
/**
 *	UI function to create the overlay display
 *
 *	@ParamsCount - 0
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
if(X39_MS2_var_UIs_XMS2_Overay_ShownInCurrentMission) exitWith { DEBUG_LOG("Overlay is already open."); };
("X39_MS2_var_UIs_XMS2_Overay" call BIS_fnc_rscLayer) cutRsc["X39_MS2_Overay", "PLAIN"];

X39_MS2_var_UIs_XMS2_Overay_ShownInCurrentMission = true;

REGION(HIDE EVERYTHING {)
	displayCtrl_Overlay(1200) ctrlShow false;
	displayCtrl_Overlay(1202) ctrlShow false;
	displayCtrl_Overlay(1204) ctrlShow false;
	displayCtrl_Overlay(1206) ctrlShow false;
	displayCtrl_Overlay(1208) ctrlShow false;
	displayCtrl_Overlay(1210) ctrlShow false;
	displayCtrl_Overlay(1203) ctrlShow false;
	displayCtrl_Overlay(1205) ctrlShow false;
	displayCtrl_Overlay(1209) ctrlShow false;
	displayCtrl_Overlay(1212) ctrlShow false;
	displayCtrl_Overlay(1214) ctrlShow false;
	displayCtrl_Overlay(1216) ctrlShow false;
	displayCtrl_Overlay(1207) ctrlShow false;
	displayCtrl_Overlay(1213) ctrlShow false;
	displayCtrl_Overlay(1217) ctrlShow false;
	displayCtrl_Overlay(1201) ctrlShow false;
	displayCtrl_Overlay(1211) ctrlShow false;
	displayCtrl_Overlay(1215) ctrlShow false;
	displayCtrl_Overlay(1218) ctrlShow false;
	displayCtrl_Overlay(1219) ctrlShow false;
	displayCtrl_Overlay(1220) ctrlShow false;
	displayCtrl_Overlay(1221) ctrlShow false;
	displayCtrl_Overlay(1222) ctrlShow false;
	displayCtrl_Overlay(1223) ctrlShow false;
	displayCtrl_Overlay(1224) ctrlShow false;
	displayCtrl_Overlay(1225) ctrlShow false;
	displayCtrl_Overlay(1226) ctrlShow false;
	displayCtrl_Overlay(1227) ctrlShow false;
	displayCtrl_Overlay(1228) ctrlShow false;
	displayCtrl_Overlay(1229) ctrlShow false;
	displayCtrl_Overlay(1231) ctrlShow false;
	displayCtrl_Overlay(1233) ctrlShow false;
	displayCtrl_Overlay(1235) ctrlShow false;
	displayCtrl_Overlay(1237) ctrlShow false;
	displayCtrl_Overlay(1230) ctrlShow false;
	displayCtrl_Overlay(1232) ctrlShow false;
	displayCtrl_Overlay(1234) ctrlShow false;
	displayCtrl_Overlay(1236) ctrlShow false;
	displayCtrl_Overlay(1238) ctrlShow false;
	displayCtrl_Overlay(1239) ctrlShow false;
	displayCtrl_Overlay(1240) ctrlShow false;
	displayCtrl_Overlay(1241) ctrlShow false;
	displayCtrl_Overlay(1242) ctrlShow false;
	displayCtrl_Overlay(1243) ctrlShow false;
	displayCtrl_Overlay(1244) ctrlShow false;
	displayCtrl_Overlay(1245) ctrlShow false;
	displayCtrl_Overlay(1246) ctrlShow false;
	displayCtrl_Overlay(1247) ctrlShow false;
	displayCtrl_Overlay(1248) ctrlShow false;
	displayCtrl_Overlay(1249) ctrlShow false;
	displayCtrl_Overlay(1250) ctrlShow false;
	displayCtrl_Overlay(1251) ctrlShow false;
	displayCtrl_Overlay(1252) ctrlShow false;
	displayCtrl_Overlay(1253) ctrlShow false;
	displayCtrl_Overlay(1255) ctrlShow false;
	displayCtrl_Overlay(1257) ctrlShow false;
	displayCtrl_Overlay(1259) ctrlShow false;
	displayCtrl_Overlay(1254) ctrlShow false;
	displayCtrl_Overlay(1256) ctrlShow false;
	displayCtrl_Overlay(1258) ctrlShow false;
	displayCtrl_Overlay(1260) ctrlShow false;
	displayCtrl_Overlay(1261) ctrlShow false;
	displayCtrl_Overlay(1262) ctrlShow false;
	displayCtrl_Overlay(1263) ctrlShow false;
	displayCtrl_Overlay(1264) ctrlShow false;
	displayCtrl_Overlay(1265) ctrlShow false;
	displayCtrl_Overlay(1266) ctrlShow false;
	displayCtrl_Overlay(1267) ctrlShow false;
	displayCtrl_Overlay(1268) ctrlShow false;
	displayCtrl_Overlay(1269) ctrlShow false;
	displayCtrl_Overlay(1270) ctrlShow false;
	displayCtrl_Overlay(1271) ctrlShow false;

	displayCtrl_Overlay(1000) ctrlShow false;
	displayCtrl_Overlay(1002) ctrlShow false;
	displayCtrl_Overlay(1004) ctrlShow false;
	displayCtrl_Overlay(1006) ctrlShow false;
	displayCtrl_Overlay(1008) ctrlShow false;
	displayCtrl_Overlay(1010) ctrlShow false;
	displayCtrl_Overlay(1003) ctrlShow false;
	displayCtrl_Overlay(1005) ctrlShow false;
	displayCtrl_Overlay(1009) ctrlShow false;
	displayCtrl_Overlay(1012) ctrlShow false;
	displayCtrl_Overlay(1014) ctrlShow false;
	displayCtrl_Overlay(1016) ctrlShow false;
	displayCtrl_Overlay(1007) ctrlShow false;
	displayCtrl_Overlay(1013) ctrlShow false;
	displayCtrl_Overlay(1017) ctrlShow false;
	displayCtrl_Overlay(1001) ctrlShow false;
	displayCtrl_Overlay(1011) ctrlShow false;
	displayCtrl_Overlay(1015) ctrlShow false;
	displayCtrl_Overlay(1018) ctrlShow false;
	displayCtrl_Overlay(1019) ctrlShow false;
	displayCtrl_Overlay(1020) ctrlShow false;
	displayCtrl_Overlay(1021) ctrlShow false;
	displayCtrl_Overlay(1022) ctrlShow false;
	displayCtrl_Overlay(1023) ctrlShow false;
	displayCtrl_Overlay(1024) ctrlShow false;
	displayCtrl_Overlay(1025) ctrlShow false;
	displayCtrl_Overlay(1026) ctrlShow false;
	displayCtrl_Overlay(1027) ctrlShow false;
	displayCtrl_Overlay(1028) ctrlShow false;
	displayCtrl_Overlay(1029) ctrlShow false;
	displayCtrl_Overlay(1031) ctrlShow false;
	displayCtrl_Overlay(1033) ctrlShow false;
	displayCtrl_Overlay(1035) ctrlShow false;
	displayCtrl_Overlay(1037) ctrlShow false;
	displayCtrl_Overlay(1030) ctrlShow false;
	displayCtrl_Overlay(1032) ctrlShow false;
	displayCtrl_Overlay(1034) ctrlShow false;
	displayCtrl_Overlay(1036) ctrlShow false;
	displayCtrl_Overlay(1038) ctrlShow false;
	displayCtrl_Overlay(1039) ctrlShow false;
	displayCtrl_Overlay(1040) ctrlShow false;
	displayCtrl_Overlay(1041) ctrlShow false;
	displayCtrl_Overlay(1042) ctrlShow false;
	displayCtrl_Overlay(1043) ctrlShow false;
	displayCtrl_Overlay(1044) ctrlShow false;
	displayCtrl_Overlay(1045) ctrlShow false;
	displayCtrl_Overlay(1046) ctrlShow false;
	displayCtrl_Overlay(1047) ctrlShow false;
	displayCtrl_Overlay(1048) ctrlShow false;
	displayCtrl_Overlay(1049) ctrlShow false;
	displayCtrl_Overlay(1050) ctrlShow false;
	displayCtrl_Overlay(1051) ctrlShow false;
	displayCtrl_Overlay(1052) ctrlShow false;
	displayCtrl_Overlay(1053) ctrlShow false;
	displayCtrl_Overlay(1055) ctrlShow false;
	displayCtrl_Overlay(1057) ctrlShow false;
	displayCtrl_Overlay(1059) ctrlShow false;
	displayCtrl_Overlay(1054) ctrlShow false;
	displayCtrl_Overlay(1056) ctrlShow false;
	displayCtrl_Overlay(1058) ctrlShow false;
	displayCtrl_Overlay(1060) ctrlShow false;
	displayCtrl_Overlay(1061) ctrlShow false;
	displayCtrl_Overlay(1062) ctrlShow false;
	displayCtrl_Overlay(1063) ctrlShow false;
	displayCtrl_Overlay(1064) ctrlShow false;
	displayCtrl_Overlay(1065) ctrlShow false;
	displayCtrl_Overlay(1066) ctrlShow false;
	displayCtrl_Overlay(1067) ctrlShow false;
	displayCtrl_Overlay(1068) ctrlShow false;
	displayCtrl_Overlay(1069) ctrlShow false;
	displayCtrl_Overlay(1070) ctrlShow false;
	displayCtrl_Overlay(1071) ctrlShow false;

	displayCtrl_Overlay(1072) ctrlShow false;

	displayCtrl_Overlay(1291) ctrlShow false;
	displayCtrl_Overlay(1292) ctrlShow false;
	displayCtrl_Overlay(1293) ctrlShow false;
	displayCtrl_Overlay(1294) ctrlShow false;
ENDREGION(})

displayCtrl_Overlay(1293) ctrlShow true;
displayCtrl_Overlay(1293) ctrlSetTextColor [1, 1, 1, 0];

displayCtrl_Overlay(1294) ctrlShow true;
displayCtrl_Overlay(1294) ctrlSetTextColor [1, 1, 1, 0];

