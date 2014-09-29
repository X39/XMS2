#define HITZONE_Head##head
#define HITZONE_LeftLowerArm##leftarm
#define HITZONE_LeftFoot##leftfoot
#define HITZONE_LeftUpperArm##leftforearm
#define HITZONE_LeftLowerLeg##leftleg
#define HITZONE_LeftUpperLeg##leftupleg
#define HITZONE_RightLowerArm##rightarm
#define HITZONE_RightFoot##rightfoot
#define HITZONE_RightUpperArm##rightforearm
#define HITZONE_RightLowerLeg##rightleg
#define HITZONE_RightUpperLeg##rightupleg
#define HITZONE_LowerBody##spine1
#define HITZONE_UpperBody##spine3

#define HITZONE_IndexHead			0
#define HITZONE_IndexLeftLowerArm	1
#define HITZONE_IndexLeftFoot		2
#define HITZONE_IndexLeftUpperArm	3
#define HITZONE_IndexLeftLowerLeg	4
#define HITZONE_IndexLeftUpperLeg	5
#define HITZONE_IndexRightLowerArm	6
#define HITZONE_IndexRightFoot		7
#define HITZONE_IndexRightUpperArm	8
#define HITZONE_IndexRightLowerLeg	9
#define HITZONE_IndexRightUpperLeg	10
#define HITZONE_IndexLowerBody		11
#define HITZONE_IndexUpperBody		12

#define HITZONE_NAME				0
#define HITZONE_Size				1
#define HITZONE_HasAterie			2
#define HITZONE_MedicalUiIdc		3
#define HITZONE_CommonName			4

#define getHitzoneInfo(INDEX, TYPE) (X39_MS2_var_Internal_HitZones select INDEX select TYPE)
#define getHitzoneIndexByName(HZ) (HZ call { private["_i", "_result"];\
	_result = -1;\
	for "_i" from 0 to ((count X39_MS2_var_Internal_HitZones) - 1) do\
	{\
		scopeName "currentLoop";\
		if(X39_MS2_var_Internal_HitZones select _i select HITZONE_NAME == _this) then\
		{\
			_result = _i;\
			breakOut "currentLoop";\
		};\
	};\
	_result\
})
