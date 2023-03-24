#ifndef vectors_4095B
#define vectors_4095B

/*
 * vectors_4095B - header file w/Siphash vectors for 4095-byte input
 */

//array with one entry for each half of the security key
const static uint64_t keys[] = {
	0x739265C413E3F8A1,
	0x2E50D3D67A88644E
};

//array w/8-byte hardware test vectors
const static uint64_t test_vectors[] = {
	0x5D85304E51D59005,
	0x4D05B10D49A78BF7,
	0x7E6F4A65742DDC97,
	0x71BEB729501303C1,
	0x352103C21CB92962,
	0x069AED6D6D7A5D7E,
	0x363C3133318441EB,
	0x4429E9C92AC3AE62,
	0x56EA833F46B01E3E,
	0x79A8B91715298F93,
	0x202B1D225972C22D,
	0x42FF9858260554EB,
	0x00DEE97F250980A7,
	0x38ED7948576491CB,
	0x51ECF61974714F43,
	0x4646DF49673E4D1E,
	0x30E5D9152F722667,
	0x23A002FE134C9056,
	0x635F94182F55237A,
	0x4C0E4CDC155EBA27,
	0x02D917A6188097DA,
	0x4A04D9C552A93A49,
	0x7D6CE8AB391548D9,
	0x7FC567170E2EC38F,
	0x2358532254576BEB,
	0x2DCA2E18796E202F,
	0x1F73751A43837045,
	0x688CF0EC70C9C670,
	0x482E583B20525E9A,
	0x14C3ADDD217A6A34,
	0x08B8B7521A1B4E54,
	0x498D74BB5B0A8D26,
	0x6E571D7D399E9067,
	0x68F3B3E16D2D77B9,
	0x028C31E151B6B195,
	0x6A37496F350200BD,
	0x07AB3B0705654987,
	0x3E7A9260343C2335,
	0x426AE6C4051823B2,
	0x596F8F9D3E3FF978,
	0x37AE19A765C339E6,
	0x2946AA2B0739BDB5,
	0x7803842657218EC1,
	0x7773ED5B11D39B17,
	0x334E054B4031DC61,
	0x5A4D2AB60C379B39,
	0x6742285F3C06BC9D,
	0x75A54D0423DA9F71,
	0x1108172B559945DC,
	0x274FF7715E9900E5,
	0x139B01A31394490C,
	0x18F99293118740E1,
	0x45C364161B463CAA,
	0x205E605C577424F3,
	0x15B41E6B082E4ADA,
	0x6DF184C079CDEFFA,
	0x0107ADAF4D623812,
	0x2483C6D417382EEC,
	0x290BCA03790B31D5,
	0x393D0E371BF7B42F,
	0x282F4F685C59CF4F,
	0x18608BEC138A38ED,
	0x3764D85E0F7177C8,
	0x650ABDA40E05D8F1,
	0x6C9ED9D6486CEF89,
	0x5C0138950C5AB516,
	0x1DE1F5F70039DB79,
	0x1B80182374FACB28,
	0x4C6EF01C63A55A0D,
	0x6BD3A4E73BDE7880,
	0x35AC687A62230E87,
	0x2F85469A59C529A7,
	0x70FD589336B41629,
	0x2FBF47FF54090D6E,
	0x7000C19D1A092297,
	0x7662F1E668FC5636,
	0x7C868F2318301106,
	0x27A188CE0EC37DD2,
	0x1CC956C333EB6781,
	0x7C58570B0CAC4672,
	0x1906FB880968309A,
	0x09A20C1358598FA0,
	0x4D545AC936E8F17F,
	0x1A8E4B8C25222437,
	0x61009CB719C34AE5,
	0x7BE6596C0661F073,
	0x60271A1B16AD0531,
	0x4D611B5A2B6BA006,
	0x7F74AD74512472AE,
	0x6B2D95457D206359,
	0x661CB98F6F756F12,
	0x07A580186190872B,
	0x705404FE62A348B2,
	0x168EB0342F4708E6,
	0x3BF34F580D1D5BC1,
	0x16858C5B12E7073F,
	0x6B4096DF54FA4AE1,
	0x0BE33C602027986F,
	0x4549BCA63894F1A8,
	0x52583C8D267187ED,
	0x2CD37860264A595D,
	0x3CF75E8E4E3E95FA,
	0x79AA36000CFA927B,
	0x5E1F052A0A5879E8,
	0x0778DD42791EE375,
	0x68945287494C9A6F,
	0x2ADD219B6D9596D1,
	0x5038DF847039D29F,
	0x1F80DB851B312699,
	0x284E825A66C78FB8,
	0x79AE96F75B742ADD,
	0x306E75BE3ED40EB6,
	0x5EFBA72564EF2DD6,
	0x1D841F7F3C51B21F,
	0x62C33A0C244563CB,
	0x4A8FBD286FDC5C0C,
	0x3E1AF2060F96B26C,
	0x1C9144E807871BB6,
	0x11DF959E37C52807,
	0x30E40B7C7AB04A12,
	0x43FCE481195872E0,
	0x06EE09B219785E03,
	0x09B230A26EDA061C,
	0x0A0B2CB55726E936,
	0x3DEE78EE29330C27,
	0x04A737043259AF10,
	0x712DBDC6379D0FE5,
	0x1C8C3DBB3515ACC3,
	0x71675EE2502964EB,
	0x746EC8B63A105D3A,
	0x29ECB947542A98EE,
	0x63C14B5A3EFE85DE,
	0x4685A1946807AB4D,
	0x1FCCD35400529042,
	0x7B02DA5458653732,
	0x71BDAA1350B0DED0,
	0x6A293CD33EFFBED6,
	0x2DD9C4F278ABB3C5,
	0x4FD29CFB73DB6D75,
	0x1D0E799C37E4F1A8,
	0x6A3EA0B80DC115E9,
	0x455E25CE21B5B0A1,
	0x56CB5D645B6C5E7E,
	0x2B95C36961EA6389,
	0x1BFAC0C44832BC46,
	0x1C5D553420048C1F,
	0x5F0311FD45E77A0B,
	0x2DEF2558001EA08E,
	0x007130D12588B391,
	0x7DEDEAC34DBBF8AD,
	0x1E6CD77D7B740B25,
	0x3A73C9FB6FAB94D6,
	0x6857489B08961451,
	0x7C7181C6684D8EEE,
	0x203280963829E596,
	0x45EAFB7F197FFB63,
	0x3B35AC040A71214E,
	0x65DD7FCC0B49214D,
	0x6D3384D712010968,
	0x5A33C5AE11734335,
	0x3177CF54092E459B,
	0x4F15BFA676911AE2,
	0x76AFBB70107AE151,
	0x360394E27D04E4FE,
	0x4AC0DDAB7720EC41,
	0x7294F76733F17FA5,
	0x239D147C692DB529,
	0x71C3C97A2D08C162,
	0x155650500BF45D17,
	0x441E42AE6E354B40,
	0x07B546A33588D0E6,
	0x3FF9F2340A093E2D,
	0x15525F7B42EAF2A7,
	0x54EBFC0F25D77200,
	0x374AB5350285E452,
	0x0BB429ED2F1FC1BD,
	0x25B0DC9F68C28489,
	0x793D65DA5AC9E993,
	0x57CECE911C609810,
	0x138184512F40FABC,
	0x63327A62228FAC3D,
	0x0BBD616606167BB8,
	0x331F3D1B06CF8EDE,
	0x12C3EBF57D812AE0,
	0x6BB6762048758D6B,
	0x7DFE5E5256E22EA3,
	0x60EB6CD1736BBCC4,
	0x3656AF6B3DF85086,
	0x63CFC287763DCC4C,
	0x78C3B09E0B42AB7B,
	0x3A626D381B1A77BC,
	0x03DCFC460477DA8B,
	0x5F41C41E601349D8,
	0x7C73E1E87D1A6220,
	0x2C5B5CDD371092AF,
	0x59A03EEC0FF56639,
	0x160BE1F20F8DD73F,
	0x165D661D655DA052,
	0x62DECB32492B1F0D,
	0x11A0AC7829215212,
	0x000380B64E954153,
	0x4200FE170F9F0ACA,
	0x4D975B5160EEED87,
	0x572CB9D37857AD82,
	0x039A58FD31671DD8,
	0x4C8195944FF06A71,
	0x546844FC3DFCC636,
	0x1E10100E505E91DA,
	0x4D78F3FB33AA091A,
	0x6ABA9BC91A83F1F6,
	0x2A79582F79D450D8,
	0x09622817445ADAB6,
	0x29B87B0840853A21,
	0x09B0592E1FBF8E34,
	0x48E0E0460C97463B,
	0x5B2C878E1B5105A7,
	0x2AF0107148E460FC,
	0x29D34E831D2D85A5,
	0x1585332778876BC2,
	0x29EE899A01000856,
	0x50F072C7191F8C25,
	0x571C525B76701F2F,
	0x46CEB1092558B7C3,
	0x5902C0DD752C6269,
	0x0FB0545F1447A504,
	0x0E1BF5DC43BD5CA7,
	0x0818375D3A29AC8E,
	0x7AAEE6B0177E1DF3,
	0x373DAC2731D0B265,
	0x3E67F8A0045F3FDE,
	0x1FB04585001E8C6E,
	0x4902ED6A1994802E,
	0x36C205D34AA055F7,
	0x4327C1B972D63BEE,
	0x73D644444C4738FB,
	0x6566C5206D164B54,
	0x63866A8344C6B70C,
	0x6A1F6ECF3C83177B,
	0x31AF79E42A551B8C,
	0x3E9CC09143222FAD,
	0x06DF8C54415FCE43,
	0x7B897AD14CB8B66D,
	0x6436D4610EF7C3B1,
	0x40C8761676386181,
	0x7A97A1601B748088,
	0x1B930CF67F306EB7,
	0x18C4EEE51A47E6E5,
	0x64E83CDC6495FA61,
	0x576C364F4F86F4B9,
	0x1BCE2DB4280FFE96,
	0x152649EA4B427A93,
	0x1009319F0134F2D4,
	0x3DB80A4F78ACB46D,
	0x2301CFF97A28A06F,
	0x3D4AD01C6F678433,
	0x30C75276619E908A,
	0x2E5746F8442A5C70,
	0x532220212C50CD47,
	0x22892EC9128E1B59,
	0x2E029BE113EA9637,
	0x131B04EE1D20D029,
	0x3768B70E4995A8D8,
	0x2E2BA3392BDFF3D4,
	0x7B66E88D1C50F3EB,
	0x4460F2810597D988,
	0x50DA541B17351641,
	0x186A091559873C6B,
	0x5233F0D860E385BB,
	0x5B0C262A56221364,
	0x458997977535C0D1,
	0x56D4515C1856F646,
	0x5C8152B67650EA0D,
	0x22A1B754052B9854,
	0x17B9B3AD2FA372D7,
	0x438E090E452AE61D,
	0x624BB64645BC4F8E,
	0x0F51F86656A90DFD,
	0x028901D119B46D55,
	0x360561403D7D9B9F,
	0x431575277DEFEA5E,
	0x1525009F7A6653C1,
	0x53ED902C13EFC943,
	0x74D34EFE2D8F09B4,
	0x03B11D1826218104,
	0x1B5741D54FDF7528,
	0x68366B6E493AB4AF,
	0x3F8B9EBC722B9331,
	0x77572B8544B7BE24,
	0x745B30FB622D5610,
	0x27583C2E0F10DF32,
	0x54CD2EC137E93A09,
	0x0E92480609A3F274,
	0x23585FC9641F2727,
	0x219CC2C7111B49D7,
	0x0F0B3435595DC109,
	0x53C414CA64B237EE,
	0x78A20131243034D4,
	0x51BF3E8827B1A4F6,
	0x4DD325FA6D75502F,
	0x3D54C55755705BA0,
	0x1EAB104F692A67D0,
	0x5B55FB01258B30C5,
	0x6A42EEE95E36AF0B,
	0x4064051C52AD2687,
	0x61BE05B95E9E1FE4,
	0x168759EE67BC414A,
	0x716033BE368B347A,
	0x1AAA5BA22519A1F4,
	0x3634EBCC14B89388,
	0x6E1654913C471E69,
	0x20F9565745402001,
	0x697054D641DA695C,
	0x698C0E52199B5789,
	0x0710A7B83B2F935E,
	0x109FEEFF375F344D,
	0x20899C1D44656D10,
	0x69F09DD52F4AFF4E,
	0x0D81AE5A7BDF971E,
	0x4E8CBDA554338CBF,
	0x32D1ACA34DE5B376,
	0x35A1F4C0304AC35F,
	0x66D5F7D949590691,
	0x6E72A8862702287E,
	0x3BBABC060180537B,
	0x3DC771E424A79452,
	0x69E7B45329D11098,
	0x6BAB79F45EC0C83C,
	0x785C1FC553580929,
	0x0E879C8855378846,
	0x0C96BC937F6CC77D,
	0x43D2348D1F278B87,
	0x4E728AD52D2058B0,
	0x28FFEFCF2DC2D263,
	0x01F65F225BF4392F,
	0x29D9ECA5778CAD74,
	0x27D770D334C80BC5,
	0x7E2112575F7BE165,
	0x067E09E40EAD68AD,
	0x102DBC286C93BADD,
	0x113B4F2F4238C5EA,
	0x6C09D6824DF52E0D,
	0x2CB5F6497B230382,
	0x4E7B0CAC57B55076,
	0x2CECD8BD2512160E,
	0x247EDD8B5D02A934,
	0x7C2A34BB39839550,
	0x66A3EE0168511219,
	0x1613E47C4A9CBF90,
	0x2690F8C00FA3DDD0,
	0x07308B44180A439E,
	0x4CD24F63506AE565,
	0x2FE6C6CB2F07FC18,
	0x3DB564C54AF361BA,
	0x37871C973664D0AF,
	0x789D96994DE320ED,
	0x1BD84EFA48C26BC6,
	0x43E56F4964A76D1C,
	0x3C5CBD92488E4543,
	0x6DA05B5112607BF5,
	0x6F6325296949964F,
	0x22CD2BA0121F38DD,
	0x7A704AF66B8D59E4,
	0x362A1974097119A1,
	0x1914F77110842F72,
	0x288E73105CBB1234,
	0x2D25F79A204582B5,
	0x4F4D7ECD7560C273,
	0x4054242E5D0CBE65,
	0x13718F140D02E392,
	0x5AE6048077DB40C5,
	0x409DAC8C0C0F25AD,
	0x70B692C976BE537A,
	0x3F4C98BE04831BD5,
	0x16E397CA2D13505C,
	0x165CE6AB2CECF40F,
	0x3F0C2CEC0646BCF3,
	0x71D416D7392A124B,
	0x429B2BEC397C77E2,
	0x4A00A75427FE304B,
	0x04B942805BB0235D,
	0x7BF5A613728F1A64,
	0x67EFDCD831DF3A1A,
	0x0EEBF87F4B4324E0,
	0x5846087328440106,
	0x201F41CB225D8793,
	0x2E6CAD40332C0CF3,
	0x29EA606D60BCEE57,
	0x65400A2C1F23400A,
	0x4C3690666936F92B,
	0x1623ED3B7C23A1F6,
	0x026A5EE962937711,
	0x1BBD895D55301A27,
	0x0EAC920A743E75C0,
	0x1C3CA60C5E58B549,
	0x3A08D8A758AD395E,
	0x4B3C53C320F5E88C,
	0x52D522A635FE7EBA,
	0x0141A39A332C309B,
	0x5B7031A161C11B25,
	0x041EA2B85987AC0D,
	0x0CB3B9007B8F736C,
	0x5C4C61C4328B4FF8,
	0x51AE9002369E196E,
	0x1FD51299418C6BF0,
	0x3DB00DE71DE52068,
	0x0078977A35F8FFD4,
	0x0B2919FC401A6CD0,
	0x3458E2911C3620D7,
	0x7A8ED62019D5AC06,
	0x7282E5645095889D,
	0x718B71293497AEC7,
	0x6A962D813DBF3927,
	0x70EB69C2446093CF,
	0x2621AEF46BD7D11C,
	0x455F7D294C5B9B63,
	0x47EB0ED02A4051AC,
	0x5CCBA1A45213362A,
	0x08B14F9824377094,
	0x65C3DC842E7A31A7,
	0x4C5F520F28866231,
	0x5E7F62062373EA6B,
	0x638E573C4CD7E989,
	0x690E0A6069A87C02,
	0x037E280817E739CD,
	0x687CC26A639CE081,
	0x18348F4876010D6C,
	0x33C046945A083393,
	0x1E68C76202CABCCA,
	0x6EA28DE624ABB056,
	0x71074BBA448A7656,
	0x6ECAC80234020B0F,
	0x0615413938F25A8A,
	0x5D29CB1E4B9669A6,
	0x7A109B4D0EC690D1,
	0x374CF30342EDA7A2,
	0x6661920E466FED5D,
	0x1347D6E615CC5509,
	0x7F74D10B49EFE94A,
	0x61D723177C55E147,
	0x5FF2C1C802F2F913,
	0x78F4067F4A53E581,
	0x245C191478275110,
	0x7AF20DDA2CB44D13,
	0x515FFD6A42C4E076,
	0x074F56CC69949BC0,
	0x1D96A6D042674924,
	0x7B59A3AE761A1ECE,
	0x41B0887423ABE809,
	0x327278DB58836ECC,
	0x1B71166E3BC123C2,
	0x0231111F69BF6BDE,
	0x7F8BC0E701D2A87C,
	0x4BC291C61578E805,
	0x11CEC94C7F0091F2,
	0x01F38B052D99B4DD,
	0x77ED9A5E71C18B14,
	0x69E8DC257AE79184,
	0x279BDE981C49B372,
	0x5F0E93E864DAE9FF,
	0x4E6F85C078FBDC02,
	0x3B632526665DEAB4,
	0x5C7809826C062C90,
	0x0FB2149936BCC8D4,
	0x0F4037A01E2891F7,
	0x59E9B5B942248D74,
	0x2BE3F9522AB14E0E,
	0x2C83F68B5C1AC6D8,
	0x7193AEDD2B6FBA39,
	0x2A704C2B78468851,
	0x25E03D2F0362782A,
	0x7524033E2C63D730,
	0x274B68B51DCDD78D,
	0x3A178B005F0CDF63,
	0x43E7C9634EE7474D,
	0x47E3234F19261EE8,
	0x7F84099D12574F23,
	0x7E5D7BB303464875,
	0x3A0311495BFC131F,
	0x7A24A5160E0F904C,
	0x50341DC1494348E9,
	0x73F496F7540E5ACF,
	0x302921A77C181713,
	0x2787D14D20788D82,
	0x18BF15D421BCD085,
	0x251F48AF51F81D78,
	0x7E5BF4A93E9F5303,
	0x5C6D2A901A434BED,
	0x79502B5125A75D5E,
	0x748EA4AB1684B590,
	0x2FAAD4793D37F4B4,
	0x4F8F43D73C71C7FA,
	0x3FB8106F2F2EDE16,
	0x0B2AF1354DECBF8A,
	0x5BFC4FD679BB21B8,
	0x42FE6AA1054F964C,
	0x595DF11B2C306D97,
	0x284884AB36F30198,
	0x576B8F1B098712C3,
	0x2B43E3484FD055F8,
	0x21C87370702AA4EF,
	0x2EC9F7F250632BF7,
	0x6AA677E420246819,
	0x45CBC5770B372282,
	0x21BBD81363F6A335,
	0x212E97E93A5A6A22,
	0x76CC321C5166AC8C,
	0x00958AA270BDDBC0,
	0x3EAA9B4A3684428B,
	0x303F64430BC07BD7,
	0x111012231AA6EB21,
	0x46D758B8733DCEE4,
	0xFF30D07D6A6E033F
};

//Correct hash value:
const static uint64_t test_hash = 0x9C4B2B58B0A1650C;

//size of input in bytes:
const static int test_vector_size_bytes = (int)sizeof(test_vectors) - 1;


#endif