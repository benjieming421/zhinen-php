/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : studysystem

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2021-04-10 16:28:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for studys_agency
-- ----------------------------
DROP TABLE IF EXISTS `studys_agency`;
CREATE TABLE `studys_agency` (
  `user_id` int(6) NOT NULL COMMENT '用户ID',
  `agency_name` varchar(64) NOT NULL COMMENT '计划名称',
  `agency_remark` varchar(255) DEFAULT NULL COMMENT '计划备注',
  `agency_daytime` date NOT NULL COMMENT '计划日期',
  `astart_time` datetime NOT NULL COMMENT '计划开始时间',
  `astop_time` datetime NOT NULL COMMENT '计划结束时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studys_agency
-- ----------------------------
INSERT INTO `studys_agency` VALUES ('100001', 'C++习题', '第三章', '2021-03-06', '2021-03-06 09:30:00', '2021-03-06 11:30:00');
INSERT INTO `studys_agency` VALUES ('100001', '高数习题', '第二章', '2021-03-06', '2021-03-06 14:30:00', '2021-03-06 16:30:00');

-- ----------------------------
-- Table structure for studys_idea
-- ----------------------------
DROP TABLE IF EXISTS `studys_idea`;
CREATE TABLE `studys_idea` (
  `idea_number` int(8) NOT NULL COMMENT '意见编号',
  `user_id` int(6) NOT NULL COMMENT '用户id',
  `manager_id` int(6) DEFAULT NULL COMMENT '管理员id',
  `idea_utext` varchar(255) NOT NULL COMMENT '用户意见',
  `idea_mtext` varchar(255) NOT NULL COMMENT '管理员反馈',
  `idea_state` varchar(32) NOT NULL DEFAULT '未处理' COMMENT '意见状态',
  PRIMARY KEY (`idea_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studys_idea
-- ----------------------------
INSERT INTO `studys_idea` VALUES ('21030101', '100001', null, '资源较少', '', '未处理');
INSERT INTO `studys_idea` VALUES ('21030102', '100002', '900001', '界面加载慢', '正在优化中', '已处理');

-- ----------------------------
-- Table structure for studys_manager
-- ----------------------------
DROP TABLE IF EXISTS `studys_manager`;
CREATE TABLE `studys_manager` (
  `manager_id` int(6) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `manager_name` varchar(32) NOT NULL COMMENT '管理员名',
  `manager_pw` char(32) NOT NULL COMMENT '管理员密码',
  `m_telphone` char(11) DEFAULT NULL COMMENT '管理员联系方式',
  PRIMARY KEY (`manager_id`)
) ENGINE=MyISAM AUTO_INCREMENT=900003 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studys_manager
-- ----------------------------
INSERT INTO `studys_manager` VALUES ('900001', '大乔', '654321', '15698632456');
INSERT INTO `studys_manager` VALUES ('900002', '张三丰', '123321', '15848263769');

-- ----------------------------
-- Table structure for studys_resource
-- ----------------------------
DROP TABLE IF EXISTS `studys_resource`;
CREATE TABLE `studys_resource` (
  `part_num` int(6) NOT NULL COMMENT '类别编号',
  `re_number` int(6) NOT NULL COMMENT '资源编号',
  `re_name` varchar(32) NOT NULL COMMENT '资源名称',
  `re_net` varchar(255) NOT NULL COMMENT '资源地址',
  `re_text` varchar(255) NOT NULL COMMENT '资源简介',
  `update_time` date NOT NULL COMMENT '上传/修改时间',
  `re_picture` mediumblob NOT NULL COMMENT '封面图片'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studys_resource
-- ----------------------------
INSERT INTO `studys_resource` VALUES ('810002', '812001', '徐涛政治', 'bilibili', '徐涛马原理1', '2021-02-20', 0x52494646681F000057454250565038205C1F0000F0BA009D012AF40177013E91449D4C25A3A2AAA173EA29501209676EE1732E00CD28A855092C514EBFAB4CB3A575989BF88DCD9DC0F01480FBA173E3956B35D3C47FC5E6BBF7215109CDF09F52F447ABD974493E7F5E13B7985D4EF7E5B28F0EA6A1D3C9E7CE983FFBEF2C6FA1B55117109FF1813FE160612FD71FD9206420282139BE13F1FB352F6E87A542817F44BA10F1A375BEA1B31767C4A0B974C3C8C4F4E0785940D67FB9FCE2B81D19507ABF04B356434BE20AC05E34AE47F845494109CDF09F920641D4980B23997640247988B8087AC4C47E1DE8C41BF5FFEDE2A62848F90807EF2C88BEA06DBC6024C652346B1561CE9D23CC54223F2CA82139BE13F240C2D8B1F53E8B693EF9A7710E74FE0AAF1AC30EC5FDC05B0BD143C6A7CD93E1323DF7A6BBE888F9F26C2B986D60F114F75C50A380C8228D5CC473B93AB002E69080A084E6F84FC901F339B0F9E08E2FDF3C8FEEF86EFFC0B4130B588DE4F5A8ABFCAE4B0F48FA26B3A30FD7AA2EB8321014109CDF07FFCF795281D3D795E73D8A02BC00650371750244D9D6BFA65679C6679090B2BFA839FA54E04646014109CDF09F920619B6D323B58743D25F4E2FB21EB478162D5FD9AAFF0479A85EDFD8F5D3193CC99AE25D103354591402C1947379457C9A16FE0922F6235E13E3D98D90AC7E4819080A084E6E8CC5612087BE5D1FB88A6D8DBE890F805C8EE2E3F49A1A358285AD15CDC746508F80E18E637BDFB3EEDD91E3863232B6017F905D6FB77ED7E9E92851DB30123935FF10E4A82139BE13F23BF41F83A7A920ACF2784DC0455DB51FA88566D427908E488E24A71E937D5029291A1A1C8B4AF0823A16207A4774F1759E4DEB903C1B88CE2CD78282139BE13F240C7EE8E92D8D4D05162EA9A51709C72D92AFB684927827FA0277DA4283FA19783AA420282139BE13F23D5EF6767441BC6B16AEBA712F5F08F6B5E3025D212D3EA905665381CCA42CB0EBCD11446EE3BD2E73CEA95BE06D4391FD9076B2A084E6F84FC9030A948BF947E0AC57B9F6AA1E9443563890BFC943E703FB1B37E500C3F982270D3FE153F0C71FC28BA70088BE2321EE5A99085706420282139BE13EE0AC9A696150BB37F4CEFCE618F55BC45EC76A53C054BC8024E9DA5F79F226B2BD304C3BFE206B3FDA82F3923BCAE0C8405042737C27E3ED0FFE1B1359E123F3FA22DED05DFB8099EC5BAD78E0CFF8D8E9E7CB8EAFD9E08E46AE27E4819080A084E6E87394E40492E1E25BF1451271FBAF88B87727B179015F6C2C9B2783DCACB9ECCC95042737C27E4819078B31D9C8F4D7A6EA01F4E57648EA898DAFC1F90FBA657D78ECBE448EC044247A934D3FD250C6664BF240C8405042737C27849AF2607069E8AE33C59273968CF0DB5DD722E37335488CDAD42151A76314F8B0231ACA82139BE13F240C2A5DFCAC28E8A2336BDF678660932E2388DE466BB4BA1AC35631E265FDC83EEFEFE320EF47999C6CD3DF9098ED2B21123ECB77FC449B4D282139BE13EF278423EBB8CAEFA4A9BFFFF804247303364A7B73784DDE5AF858AE833BB25DED394DAD453B1F7D08E9A3B3D9FD81185EF2EBF7A020190E31B7B1D02AB27A167A443458874453799FE5FDAD8A128E4A7EAE21BAE7FFFF8B13880EE0E7FC2123D7D06FEBACEB65E147B33CBE683DA122D500EDED55129EEC79900526976DE222540BF1B9CAD089E2895EBC2E1AA0C2C5FBF861DF791C5A77F9B10FB8BC7FDB79D2CA60054FAFC7987ADA0F5544D6C004BA813258857CC967874104266AEA69987599B240CB43497382E9FF2086B84F6ABE2D82B7E08975162FCFE77BE47DE080A7B3393054DB2F12272EFCCC2F9B46B4D03C21A9F76EE7138AC3009908AC140BEBA65DA3663AD27F05EF4B329919581F722A005BEC1451569AFF4B7DA3C0C6727166C1324EC2B7FF08A6707299FC1C8AF74827A66EAF316D09C056D8FB90FE7D1A8E5BE2B1E179411A09D9344AFC67E2006B838663ED1F2946B1B66B9C53B06F0CB762B09F9ED6F4C4C5FAEB96FA3A1D7D25933842DF37A9667B461A121F396558F1263725348AFFD09F0C79B6424118A331BAC99FDF15F5D88C0F57D440F3780D82A514EC0000FEF5EA000EDB176FFD2845EC0A0583FBFB9A24B5A643814D1345FED9FEA38F077980FCFE48FA08829504CF53A3B40C436B95380A0268DA79A312A5C17C6EBE32990F93D046EDCE12E9049FFBB4CCAF66D0B2679B3AD514A142B65E1B7C32FD6699F6180CAF8E248137BD659D3C7270748B1D3CEB2B05B7C94E1BEF2AAAE4366F9E25BD43F09914977E6976CA619D1A997953D42FCE09E10BBD3D53A6CCFC30989864B308D15680C9FCA0683BCFB8925C9C2766C5C9F6E5C926F99593F73C95BEF496F520539AA008619A1B6C65F9AD47AE98B13CC3A574AFEE6C36A4C1290EC0AFA1152A378A8280020DCEB807E77E65FD40218CA35148693BF13CC53D221BA1B73A6120FCFD1E75A8000C91FEFAD0878E4442C5473A5CCB5932C25E49C7C138A32413F4938E8231854A14BC0840F980073148D12637D9CBDDF3D094FC967506D23ADD04808A808A36688EBAEE0A0B548D6224C755669E4ABE153F65C33D571620FC589DA3B7DAB4CA669E48869388449FB920500A8D3EEB1F347FB6CF2B8F2E98BA1ED1B556A8E5D413C329910905C2BBB44C2A29195E547787661587282A132954EB7B7DCCF65B1F18A008383C00C76DA0FAA7CDDF2A5604B3EDED089DCB682BFC20970452022410FC34CD21B3E8B7ECD4AC9103B53C04BDF14D0C102408C3CAB84E3E81CBEA994A628C605B1DBAF88288C950871D79A603AFA2DF66FD7F63F4008A871660C496A78B55AED8711C9CEE135929C59C7EB9A1A1FFA53096121AF11454AE402676459C414CA6244BEC10CE6C5BF27A1704B403C01021DE77C9A90E32710CFE744B9A7C1A7E0B66961EA3416E85C0D0606B2B7F7B77E7B31A352C2600010A1E9A73C0CB796983277E41AA2001E67E1C00BC6FD198A8B6A9AE68C91E3888FF62BB20A96F891ED497A2D8A6A84E7C365F79130DDA56F87E9A76A1202AEF81B73583ABF2342306C6F5D88B61128D485D0AC4FEED8B3E1C5B86F12215751CC361B87CE171F90D1B2B012E796ECFA914422FF17F78719019111B8185C028ADFB8DAC0F824753526F51E7AC2CFE9F0CFE797869A2CF1837C17F27C0424E7FF613AE17ECE0E43CCC05EB6F8F63A2178C9618F48B746BE9FBDF5D52175E978AE1D1D00BADE743585F928DA1E973C0D1A767CDC3A70E1A8120FAD31470E28B0268AD00C85FEE872C6D0365BF9C8A5BB6029D5652FE24196997EBEFF83B2E872FC004B37F7F57129EAA0B8ADE062CF9403FCE8A54616919B35DA560D946162E061CC906E40DA706179A8650F52DAEC51D00D747EDB527F28A8C3A99C5A3F96865C7CC5651DA42FDC2EC27395D1DC2365E0E9B2B0FE54E6646D4E892A008776632D7D9F6564C8EA5BDF30F54297EC39DB3284CF8F4E6B00CF8C57597260C100911DF4C79EB2308DB0C94AC86E990A1125438CEFD37047471563D45FF84B7AB82BFAB55710A26BE4125E9EC11B5C320CFFEF2FFA12F452EF6E074D54C59C737023D7EB86D2AABDBF234714882C903A049D800E39557241F85B5EDBB0A33F530A36E2E37C88A851FB0BFEE278B7FD0D557ECD46175E6F8086E7BB99C688FA40C362474C708296C53D6E4747602C28A01DC200DE5BE40E46E6CDE29A3B3DF889C89C8ED2DE64E68A9EE60462B616361F5155E9214EE6356FCDCD2223AD712C41CF9627EE55D9F46B4E3777822A76EAC33362888F07A4A8A4CC87F0C75776F358AC7E90E51A42D1FF0007D73010D1DF81850D51C45DFA3DFF58DE62AA2B1EADA2DB389C99A80BBAB531217CF0E810246464B9C01AA450733E9E9CCC9B093F6E888EE23021E751F2A2404493A9EB096BFE7052A9418FC3FAD24B6CB2AB2C92D4DDADE2096234C397CF0069F1B2E03412B0BD8EEB8CA805FA3444485B3FCD4087C7F5D55C1982193362F89C71AA649FC69D3F06EC5E05E99EE773A9800088FF1D784A617D697ABA2C8B3D3EDC9FAFF867E225531E7C662EB8A3CA2ECDD52B7B2B5DC5CC2ED9235EB127AF9C961E92669D8645839E6E4C650FFE1D088206FC1B38FFE0743D78B9601421A31C6119B6D2169A35CFE3E8E2E50D21E60A92E7F9A5772D707BB87973035F05ACCD59421AA94F49C5A607361CCD4EA39B3ED8CE7A3D911C380BD860E09ABD8E869F8ACC2FEBA965BCFA825FA9F5963615FCDE7876A9D657744AB364AF101FA87E458D72AE8F7986F1D183028E24ED9D9B6B45EBFAB5A6D9EA382BB3DA1D17A6B6C8E9DE13C3B3011E80BDC6BF8D561FBF805CA138508AD7733DDF1927E3B96F62448280E00037D3DE8F2895509123BE9D66D048E30A5DEB78C112A83240DE5908869477F4900F8EA472ACB6FDCB17AEF883E94DE5AF26147B8BC7B62F5D75038AA70C4ADEC12B0BCE52D7B2ED556B0729E0BB5A7B97423D24497AF41E13FED2CD699AFC8E0EDFCADDC7C6C3528A64064D908C9CC348E28FD86718EB8A0051E65F45023A808ABAAD63C240D10A3359252D35E6C00B72AA89A9666DA1B451BFB7952292F1C4A78BC57A6FAB4EC62C7D6DC4C144066ED9CAC1FB2807F2835E6F05BCF5EEC6482FFCA9772AEC053F60B572724E5A434CF9A2DB6A95CF8192104E0E0832B1BE5A3E3B15CD570E1D3CD74358EC137C7B21C32ADEB415377D865732BA096FF84C129CBADB6F76637F6D7766F3A87D8EABC4F72C6219768C2EED424E399D830C090F5E049234B2AAE444523B0420B62B17EFCA9C4DBBCF39CC054B7F84BABC7C32662C5BB67308820E8D605EE58FBAC641075DCF88ED1933E7A06EA908F43435C83AC6568C4FA647E23F787B70E362CF47EA1DFD5FE513EC27F58E4AD685FA7F2C4C09DBD9A555FA8EF90E0A3146D565240ADAD8B0DC38FAD61A2BD5F6E0A2862E4F6D5177C026ED69470876F7184837A5B2E1122431117C56968D5CB2214E26340F71AED5CD9505AEF9B7414F223E092C8DED9A076A1424DCE0F2257E816D1CEB37442BD5E3486A48B27B2FB1DE2372D1FBA1632F5ED0CF7DD498A2556B42CD8D28204473723F89F0FCE8A98B1AB56E6EDD1E241952E1690F06B34039499AEBD188F63BCDBC8ABD2B9B4425D0507BE4BFBDBAFD3AB17D74E81094F01049ED74258EED37FCCD7386851EA2186EBD71E124A2C8711C90C64EDD8AA07B291FA246063F184B983DDE30B0F16C60E9FFF8C2195991B932CBBE767B46C98737C85E7C8C797DC284868777D13771F93CEBDC66574844ACD30C087AF6C83DA3F67E82C494C553B58004914B029D518D8447EC32779E72815FF74A71F2009AD815B7C7A2BEE8AFBAF4F26EFA631EA102DD5B37E011915FCDB8C9849514B2185F2F211329CE44F0B48551EF3D3B524501A152934F5220764E66B552B3FF741DFAA6F9E1789B6295D569E8E7D2CF4B163E7563069CE2446D5819C032D5E0B0A093A54ABA0FDA0953DBB3DA53B3D7C552F81FC339A00004780028E3D06BE7E3D5B768A9E4EF92955C4D04D02AFE4AE772CD0EB851312237BB12BE80DF6EFE539C4A36D2E211F4725B41198606F87700650CE874DFB0A15881D216B3468F53E265A39B38B8A0FAB91CA847A9326D0ECD472273496CB3319DABEA737ADD8FF4F87CAA48180326A8511030E72D8B5F416AD57B8998A1965CD6F6B53782355062F79819B2001EA96946DDF54A01AA285246D131F2BE56B5E40016ED2619871BB4A9F03E8D667BF2EAB85D9270A4B7A2B88DC12AD6C309FAE94EF173074ABC5CA123276B68E33CF11172D2E915BE7839F1C06ECB27EF806FDA1CEBD90C0987A5422B58F679F23F1034737F05D9CEEC219C9209741849FE0BCC37923487CF6603D07EAF0104B19412BE5DFF4148D9F0F088337F844E04191CC27871300F89980CA4F35AFCD4969BE258F10A2FBA8B577217CE4414FB6971CE6BD3C35E6CF93DCAF9F2C9AC7AE8C3A6189093D313A0EAED2FEDBF2B3ECED0420000EF5233095B3C86F47E752BFAEDD6C4E3372453538D259684014999E8BAA746761882D8D81636940E5A10F115C0DEB6D2D589118BC2B359B4405C7D292CD3FEFDA12A67AC9B8585A4189A885C2BF461F2332C98C9085DE88C38A40FA3F0A87DE9BBF7A665440BD65E7C5216DACF63E6634DD60A3382CA616CEE9CC6003A4A873431163A75B999CA7F43C9BB9DE23A54CE068AA86BE9DB8872DEAE9B26C54D32EA44D643BCCD80900428C2EFD74C83E33B0CEC5F60176711B0C5B1F35613AC0D1B7B1A2FDB4937B5FC831F9F7078D8D65D9111889F27707FC02048D1A4625A65A82A1A9355B833E3E4332B08C82892670CF30C106C422B3E29EC80000BCA262236E1D49F0A8D7F4E6A72EB679B75F7072CBCC6BBCB86C4A3DB2B7F33350FE2679B8702D424B14872A4CE152153C79686ADF26F310E2254257959CCADDEE69D622D0CE0CF025D6A229CEAE816C69C41F1767CA21ED6DC487A8CD22A0F81DF67D6F7E0883725B5F396E7D7A80FF6C26BC8FD0B977F4827FFA57B80C34F56B5F6649552CEB42E280C872F82635A19FB4BFEB064A795AE8000042502576C13AA5D31F16185A0D45D98400F61D21276E859A51DC00EFD5FFEB544C8F0B7675907518013BBED099A35A5CD952D7E9C13877CC93F5E5DFFC766172AB883C0AAACBAED4B0FC194B1CB0C2F8FAA619F470199242E93D9E842696B1B46BE8E223A665DEB088FD433723D5FCA7FC83161FA3B66D76E446A75EAB07A73AEC22B7DB99906DDF67BC326601AA52AD85EB697D35CEE6CDC8D9E0B530677D77BAD9BB2BAEAC1AF7DD9CF9BB8CACB7DF604F1BB025791034E595269A25E54F9487B194FC871136D395DE87EFFC4D5B989926CB2F523A940F39190D6AADC520586FFF04B0BC20A72F7266B1B2BCA73E426B2D68FA0BC7DB4FF978008503B230533488CBB7707C03865C6EE8C3BF154EBDFE016FDE824697FF8FDC12AF7C9C9502DC8A3242F5E52A84E340A32991B878EB3CACFBA4BE6849AB55CAC5CACAA718BE8AEC7022A8B33ADDBB7B6083A38B1EF8ADE90FE6FB606F2CEF0F40347EA09FB2FE1D1832880A72929F7EF5284276C05738684F617E54853CEF60319E61F2127C680536460E18446A74CEC7C54D8E5A0EC48B050841D5C965A82F4B9A0884E7464160F4D94DE276C9E3B6F1FCC2F82F407B20678C7CDA10B6F76FD9778F82940BCA0F9E0CD5B98827767602556CA2E2BEEE0D4FB8FE482E428D0210913061AF6C307282DFCECF7F21EE8A46543AA3EECCDF22952E44F5D8E7D0A5735371637CB34E9323F30AA053BEBB724716E50DD35D4E2A8422F234E952D67F26915D55C880344AFA03A9DBFE347B89EDA99DAE3C604BF44A80CF91D537E63B423A8C12C6718D481329EA6025A22994875BD6DC78354CFA1D0000244DBF487B0E1BFA88C7B083C96EFF201510A1E6CCA4090FDFEED40006488C95FA6AA4DA3BD7306B4BBF43856F25CF6EB02D38E530BF1A1115D4661B3F5FF06DCE61C20EAB299C071D37C0BC1DA4E175FE0F096DF6816D316328445DA60C7D631E591571C358E2BA889079F72BE6CC7F6389030F7F7F3FD0C3E770E617A730833F9DA1F520CBA5A3492AB4C070278957D9602E845B70FC15572539D8FBF1EA71AE405688CC90F9BEFAED657F4A48480E6BF9A855068DC497554244F06E81CD4EF55070A30A489B163029FD71DAB854FF576A0C6D5E4010A31C84DE311685A71839593FFED9084D84F74C7873F6B5165F1BA04A57280DD26BB9030AA00E63010DF3EF7879FC2761CEEA57E3B1DA609F65F888F308FF065C35FCB2EF0901D7AED75B47C4A0DCDF108944A6B05873FF86F41439C27AACA6D7224948629BC6D3B1BABEAEECCB8C9BC2723F316FF470380D29D70DE7A2E690C847AC6FD64C09C02B442FB84731B30B7CFAD742E21DC45B4AE766C1A6D74B8E78F7360B19BBC83ACD106AF36B08BCA2E6334125659F95699A8496B1D0E9B092A8491BA3643A3D83A2BFD64C38B02A6F5BDFBAD298E1084AE326ECD845F1394A0D5E656092E9D2BE9D4B0AEA9B29B346F55E2C6F973899B07123CBDDC1519FC27B19C01028D68A20BF6617E6834924B1A855609019E160B4CBA934130018DD6F17DB1AFA5557F428EE17E4492632A82A02902C9F08AC51C987147A1E327E76758F8DEC730FE622BD177D7D7709F712DB0C0DCE56E4F78831306B75CA530DC1C43CC20072BA2A5BD7E1772175AE1B9CC29C31A68982F7005C3C3B7A0251ABE64AD2837EA49D3E118F757503B49EFB9D648B39FC7C5191BF9DD43451E11B505DF118F30E289A3EBADAC91BF92A1E407EC2417B61B853832E53CCCFE411E58C11A66D8CD62CF7D1194306F654418AC58656BE53ECE2A7794AE7BAD888B9B870963C4F94D842E72375B69836904A87464E0E1393D75A6C6D318A36322B55F88390E665D3273DA84734B505D58F94CD0F3380500E81695A45D02FAB75A512EB79E47565181BA5E90FEC91E8EC1017D65A2AB666E4B7E2221588DBC5D05E2C929A27BFEEBA73E288F685B610A7ECAF938C54F1C0918059D20A5119AC7BBCFC47E485C8FF606EB0D289E7327B42F8BCDBB9F7FE8C2C7DBE0DB213B7BFEA5037B8677C44BD2C916548279E7CC77FACAABACCBFDC2A1E94EE580BA9B18C78B72D8F1EAB2C7ACE5E1B0C9C116AA5277749A1EC99FF29BC1A2EDAE180A3CCBAC16DECB04375992766F717960E1AA9BEA0190D23E1EB9CFEF4ABF6E3A435ABEFD4DE1F797EEF793335072CF3338AA5AC5C2F76C7DEA2C05263D1F49619D1D7523138C25B56E157BB20B073E2995961588CB0066D0B4E5244744B5189EED436A8F5D1E488BB75F47CBCE1DC2EC58764E3C288D2D8381C650A51F38654093231C4D99626FE83B6C257828F0F32059060C70B8217BF1DE3522ACA69ECD4F591AA6D8F0DCCA56604A03987D4EB124898932EAF26907804FD3C6F4523857900422008908987EA9211754D8626309F1193447FE3233ABAEFA8F046C89E7B59CDF64EF72FD45D8F8E6438C4AB4E3D37B057725F064C81F713A6B8D5B1EB6AFF8CAE394EBAE96B0BB6BAB64988C7DEAD04ACE6921910B7B2B4387672E5D28922FB88E4355A98BE8178B29DC3BDE5DFA5A1BB62A6C24DC644E3E113504160A3C57F38297D65E4CF6D8ECEDA8BC5996F84D34BC32642D828FA91E583A861A64E60F59BD34EDE93C5D6C49D592318E2B2E3FB146D2F58267F125C937D9760A34078A46F9FEC810BEB077D588B5BCD8B9DC2A8EFA2204DA2FB23F70883DB9BC6CBAE665D51CBDF9B48C10785F9BC511C79AFBC952E67043D3B1B03EFAC9C6E4DA2B30F055CD334D830E79A441EFFE251908E3A317E0AFF0037BFA3AA9CAAD36476640AA2210DEB2EC2DD0B1057354B7F5E9B4F7F66B3F855CEB77AFEA0776DF6BA98AECFB1ADCBBED08AE16F58EA444DC9F740ED30E9564ED10EE845CBBCFF95EAEA2BB3973CA9B2CE6EACE2124B73C44E1FB9D83BF77576EACBD92CAA99EB656E144BA8F47972D5979A4BADE5C67520B397E78B67595BDAF695067E569C795A049CEA300B0BD940D21119F33CB02965F15BC63FE19DFE54673076569E573FD5647325FBAEBFCC753077411B66C2B61BFBC6D6E50D7C66F312C136F846DDB39579ED027F4D13069DB2896ACF110F7ED0810B89EDB2487C2C9BF1ECE6C13C6DA63052D7EAD59340140D28EF627E64069770436178F13F5E62D72140950CAE4B88F4DF2E7D1D6BB1F3CA2BDE7BF807C8B8456FD4452908577E37B4C714E3E5DA8B0B0BE5413BE9639711AE7FDE7D18ED8BD1209E5E9B89DD06D23280141AA531424139411C70D34F0087E0D2CB03CFB8A6CF1C8E00115D2C579A3C06EFDBAF76384910192B9A182CBA6F2E1AC8A361F6409EFA48BDC148C475432E34FAFDCFA59E43816CE553B06E1113F308473F45357071EB2F142BB01263877E545B9C7AF2785BCC1774F1684BBFBD9069502ACECE9D3F5A484CB5F92B7F7DA27929F65CB27EE6F38B8A318C587B10906CAC7E20B9AFB956B3A57B27EC86C2E7D800A3B1EA92113BDC8340917E870D917D0017E9E895500C26250160F36DF9B77A6A41E5B7F261C0EDCD8168777CBC2FE0D4A8707716BD1C8DE9A7554AD191F261BA13F4493A008D1EAD542B85A7FBF3970DFCA149B40AD5319A7E30D10B0A7277DC3BA32708CC664A38E2D002E53447F526A712662396E8006C0B04DFAB9730C136D3B1116029EE1BFA33AAE8CC916F37CE40E6CC6D3A371A891C768B677AB40E6D085440240997C38FA31073BDC2DEA1296B57AFE4A6EB0A0C2CB056D42226A2B053D0AF5ADFD5666998255C62ED6B71A2084C37601E810E897C07FF014B6E33EC0C85E9971A19247485B9B5091D48041C6B1F107178B00FAA1DCF394786AF69247DA72BE08FBE63AD76F2A8DAE08953394E949807D49513128B7A86628A792CBADA251110FCD22A6FB67D98A3362126A68ABDBD2490E33888E0F3920CDFA4793DCB0EF130711D1CA18E87C24E7D8D77CDFC064A9F714C6C64F263C6A4C2F9BC9F87BFCAD3DE87A20CC530F286946D1F88E42C5C50E9CC31E91E02538384B92454A254B4704B9C65176AF38254A0C3724C298816D821AA46FAF5CA98DDFDB3ADAF35F1C083F4EB3A0FE36E6ACCEB2F31FABEF50A1B313F8E6D357898792EA2FDA379658D8E8B0BDB47A7C98FF8E7924BAD983120ABA2B0948F623C9918074F14ED63944594F2B89CC2F33BD27F6C954534A6AB1849867A375B4F3CE17B03F53E76235A9DA4EC1E9ADBD83EF351F1EF3FAF8AF49C0EDF97D34DEA66C5BB22A40AFB2CDB43442E5AB7599EEC929B1D8615F994B1EA30B2EF3693D0A34AB9310090304BEAE0361813CFC39039284CE33453B317ECD774681B30E7DBADBBFC9403D5DD23EC376D7933C6A38D05DFC5F9F87BFE43975A0D069CC4648731F0B696CD8766EED65110D37A31F6E6F0EAA8E59968858B32F38EFEC45301A33F54ACDB54197FE089CDEE4487FB7F72DDEA4268B1C0829999676B833C21A0AD8842257C549F81A005D4B6FC7E3149CD3CB8DE26FBB154443B0E3C091D58AF13805B74D054D3EA02B253FBB60E368AB9EA1AE0B1FACBFF059C304FC5AE3514A12F7B03801DDF1894115D251400228C8C4A784B7E396C62DB754F8AA4F581E60B5C5231276AD2E639D0F2422E12893DAA98600141BA7E3E45AA3E49B169C7FC7F69D7B791CFBC79A630F9D67CB63F83D19452350D56A60B4A83D1F60A7CBE71C52500F42E87ACECA2824F168D1318B1C068A1410000);
INSERT INTO `studys_resource` VALUES ('810002', '812002', '王江涛英语', 'bilibli', '英二小作文1', '2021-02-20', 0x52494646F21500005745425056503820E6150000F094009D012A900190013E91469F4B25A3A32CA431C979901209676EBE70E342A675017DD2F5541DE5CB0EF92BB0757210CA2EA65423D04E77714CA667FFFD9663682004B4C718B0D50705CC157FEDDCE0A17BE20BA7C17532A1908095F0C60A0A11A7E72A2ED9425CEAA8AD4929E3074E1CA46752F588A6A2C2C54564DA2EB577274781FB76543210117FF2FF14B6C58AA5FB314DF928B95DA255AA0366C7EF2D2AEDECD68CE8536453A6C85D4F81FB765431FF7AF1BD36DD8106FF89493CD81A9488F40A46BA572F2FFF8D8AE21C436550C8404AFDBABF839FFD93019E8A52B311124A817EC7701FBEBA42C8F3764F4E70145B9AC22B6F8A6BDA828AA669F7128A625FFCE8095FB7654320EBC059C04EF03A45BC4BABBDABF6BDD28AD59FF259A236052979FC2A724F88E804B615EE5D97A4C30EC605241C878F59600CDB4A8C651811B97C0FDBB2A190761E9B175B3F26DCEC12A74DE7AA818914BC1563D3C92C54FEC0334385B52B4CAACB4421F172B75BE7A476B03C9AA550C8404AFDBAC2C9B8D4924608445D43113A9F7AD32897F39B4408FCA7656B32882FB5DB8354C8B17DBF738C8F326325875121A5980C76550C8404AFDB4BD5E1E4ADB5331BF6102C2E7E51F5A9FD78F75CFE557BF5158074172A33D293F85DE7DBE49B5FB7654321012AB2655138C0BEFB2788A6B88AC909960D364FFE1063C08C47FCC9F8219EA7C0FDBB2A187E1D1D8BA39B27526B9FAAE74279386A0F8DC0D9134A7A3256D08DA578D09A2AB16C4DAFDBB2A1908095462BBF90D45A226C485B76098FECAF3F5F159BCD97ADB5EB0546BF1DC4FAFA0523CFF90CA1B199D7264DE64794F53E07CB01D175A88B99F908D69E02C556FF2143B17715210F41DE3879229D6F920E13A40E09377FDAD7C3B5E2AE9CD60998D0C452D4825C34ECACEF60D3F6C48757BB20BA8C1D6EB07212F8F961000609F92089E059B67185486E2323DA62DEEFAA1522632BF0296E38A1FF752F8E5808EFE905852323933767668580BC09E7B220B021E70FA43E98AF1D9A4E9DFE8B3F75B1DBF658CD5D758F9DD8B9E805030DA1A373498675467A3560A41560CE137E23233D5A36782FAA61266660960FBDED5F369B0BFB826287A6A0130B9501A351CCD2D2473B01D05C0EB9B58DC53699877C3A8BD26C34A8F7D513344CE00EF1C6C94E12165E41BB7666C969CF3C324264B89A32CE5810573D7C7C3F471154EE7531E20653A0C1382CE166666C0B385FCE56B19B06404894763DF0611E4CBF0F31FA61B6DF7D75E84E0AD9975DCD420AB047D0F7EDD027E59B8471B7660FDDDA1F4CA55433DD3F2CEA262BC6932444673FE6B34329584314E98C1E67CC84DB7E09C7EAAF601D31EB528782BFF1583EDBB3E4635E64D28BB3DC844F83D2930A14D96C6E054D9666D408FE4AB5F0D34E7AEB7FF1F144F6042346CA1640A50CEE387237E862801CC6AF4A74FCEDEDB0C54C66BB43309406E61083A3569E7C0E6435C85D4D44167066C37A4D4D3242BAA839547EB7316B3090D60A9EFC4DD12C0BA8F6DF9B30E05C5FEE5B8665E0483412DE1F1EED5418A85883C7F9A0E959A5B68C0CBBAE6B9B0E5676C88BC32E77105356D7F39E2C1BED0EC56EA568F2CBAB7488F3E330F5F83735CCE15738E061AD472167C7E250A8CFB6580218202E6A2B8704A20000FEFEC45803E8BD3BBCE270CF326BCD16937591DB40A543F678CCB4BBBB57E946C94BE5CF5CE99609FF10D2804F544520F3EE59211D5C911228AF36E0D4757574D0B019C09BD98C2B21F7160D4A32BFCF3675439C72BDE5C1F0B32ACF95952DF24DC1A05D9225FE688D1C127FE5B3856EEC609B2513683E9E17058000134A9CCD3B9823B1358CF8C2EC5D89975FE8D09E6F74C79711BD71A9BD8FDFB0CBCC8F1473A6044952F287512A56AFA5A12029AB7E197DA82EB46C9542CAE24C3F487E489C472F445C2075D4C22AE259A431B6279902824911DE62D9BD20B1643F199B0D8F9B99CED1631EED3A06FE760626ED486AA1F3F7ECD1E9DBA829156A9DB148C658140E47EAA64B777E3BE971F803006B10000CB026F7A4EB9EC9833628F53E0DD0F3628272E6D55D404CEAAC591566AB38D1472E932F8EDEE1A1271C9992148BCFA07568F0F6F0789403B3A0591D0F6C208F1C48F6BA93C756BE07579FA0F5E071303E7AD70927F20ADE717FE71859203DD555613D46950C958BA39894CF63F42202BB7DD164EC007A55AB40B0F80E5B06C15195D829EDC24A56AC900D3A4E0EA2BB920FD3EB88AEFE79BBAA5F7988A547B3BBA59E67F3EC1211AABDEB133E9BDEF2A64B23E551D7FC221132AAF8DF26D01ED43BD10C49CA8B682A0F87E84102ACAD43FFA8705591963C8F7C7A0E1E5F56EC007231C66F2056F08BC9150BA1C37CCB00D14B36E96DF2734B54DAD56CBB1E185BC2692184BDCBDA7835757CD1449EDE183E55B41AD6B92B442B842B24EF0F2C3A863F9877D544376D8E625081DC4E05D898491720D5DA8DE9D3074012E2144546DBBF35A286BE3645ED8A7A3FB38C548618998B0BE9BE5546543923BE9FC7B0AC401CCEA51E43EDDB23167285D8B5C2BFB782AC51C0B5A6A79CA29B7400920F5047F7A705AC389A259E14DA6005784951A2781EE626840A899D2B9579653F07495F6171EF817AA03B2F0181972B75513EB04F6FCF8386D7C0F9C939E459557125E9FA9208C53F398F635E597543F41C901A954C66713B1412ECDA89D22FB4C4ACDC101DF2DB973D9070F6F0338A6E306D22D1E6B420C640DD3BF83693011B470675A5B87C767F1C0A83AD8727EFCE187DBF4FD6438B096104B1977695C67FB3DDCB2CBDAB89E2073C6D511F8E583E8DDC47541ADC76218A186AEEF02A48EDC46FF35620927085E70B5C2488D91AC0433BC8680FC5EBBD566AE16FE7F558D3DDEEEDCBF37F6EF123184A5021E810C3314A06936B6F5E1BC73CF706D139919F1F0AF3EB2F70243CD8F3C0022EE1BE5323725D28C30468224E8E5995F7977111D77B9E551F025CEC4CACD261B464D5FD846329A32409C42ACDF174B92E10D89EF56EDE5C013E9B3D32EC9261505F9F40AC0938D1554A9F615D6D229043F3ACBBA2E8564CEE7760C7D246B76036D768AEB97683BEC04622763823425BD3FF7DDD4D4E36C3EF22EC3F37D1887290825278B7A1E0D39CFDCBE39739176339F10B6D0D055E6CAC1F1F80002C78316CCA258A65CC5AE885CF056FB7D2EA7276E1662C23D395319692B78EC95FE6002426825E2D9DE886A4BF8E4AD7A3522DB6729D4467C45236B7AAD94CAA4977F4AAA4D594CC569CA5248A3655567029B5F37B0690A1125E25838B7C103DF4E4DBBFE89CEDAAEE4F8A28BAC8144A207C51D7161503D2C03B2E92821FD484FC86A5695528D3FE658925DF6E0BD2D35F9D1071BD5FA13578334CB4FE4DBDBB77F66597EE3C208B8766729A5F09C95A0FD0131F25A44F373B9E9B9188AE49EA221374D923D6C7AA5484BB6822520001C24E4609BD719EDA218513E517F1BF21D4BE124EF558B307CB97BAD5E09E490D31E795B24E004CA26731B49CA8015B39816A74C2DB53BEEB83DCD6736AD4948281B5A380E5A0E3539D53600A814E8CD66A746D942527759FB8783C9DBB88D9B40BD220182902FE9F623214800FC95244AEA0503E28C86C0EFB52DA2F3C512B1985F52020570CF5A7CCBB762A4FDE8E8AA2E70323C175D6FB997BDF90544916DE775D8AA7B34000AD3D452372128606A45F5A33F3D6BA0849E125BF9849C7738EB1E77EAB93C5EC8AA5A7DE47121B911C42332F1B78997E2CA66C40F4FC8CF9232F29CEB00DBEA4BF4BE15FCD08BC955021447813959411098F3ED54BAC7B4658B28FA627DD847E9E0AC596127255C59BD925A8B5CB7F2B7230ED317E27545FA0B1A424EC54C83A662B33F1D029F25D8D1D8887740901A82EABCD4B94121FF70D03150FCE7C1F579B1C3FEA57FEB8161586C76677C3C16C780582B4ED789A505D5A36D25502E6DC8504405AC9288F26E6CBF6418A30E92AB20047A58C6C71E11247759DA2C663545B498DFD2A588F80ABAA79077510230FD0B1CC8D6C6A48DC012E5716B565A25CE6317ACB5668510BB30A1243DD7794BB948267446C4A401E0B8F2B3162636018D6B3E04E820B4A215F1F7784547CFD296CDC282151FC78F9FEB86A4FED2774518103946C0005FE876119F6AB0F8FD7826293A5F244838E41CD7E1A5D271A0EF743FF11A7E38735AC70BA7B1CB471B91A10B7541873DBA55A81118867B4B5FAFFAB7DDA4880297AAB3C70EFFB5040036F1309FE902A6BF59114139BA8E82BE6B9A9346F78D8FD027BE9AED5960F500D0B6792DA748420000005DF9CED7429555636EE41FCD64F58E5A56B94087FC70BC185F951AF93F3B37FBC14E10684C7EC0A4B6CA81361E30ED16EE462885014ED0FC75764EC728158BC7532757BF7F043C2554102653B069ED5F534273C361D8D7A14CB88CBFC94CD406F2F29E32A2D1C22B2CBABB587DB7B296E8A30BA1CECFBE4517B436C8C881CC5C69A000C6E26D0561FD23E40B551A72FD4B204CD60189650B9256201F5CC97DEE05FB030B1E17DA62980309BF5CFB12EEA553FE060745B8B6B30C6BACEDFC0911BC53516F41CCFF05F1FAD6C3BBD91AC9E64D7AC91116D44B7D26467C7CBFEEC91E4EA21CA75CC007CA48BD2373FC6FAAB4FBEEE1111A1F2528EB73EED089321582D57AF3831F9B22544FB4151265061AB108BD6793656AD73DE6223AE32A2610470A964CC8F16582A8D94E63CA4C1F3B631244AA74A793EE44A86DAF5A4EAC7A972B980A9376152EC5C8F14ED7073CA22989149462C8CC0163AEE34D05DD062FBB142914BA27131233423B99F25BFCE4A685A97E6B533E12EC4120F5F26938BAC056430C7EF74655FABFAABB3BA74601E7701AD558231AFC1771F7B07D33B4860ADA58D82D308400CF5A3F130E4D330BE74A79F536EBCA149C091473233E224F305F0302D07DFF52C1648C96EA93CDE1732AD3FEADFA31B14C61DE80775B2B363BE2C938AF48CD9A61BBCC682768FC87F0524B19543C87F7338E09F18820060ADEE8AC71FEF1AAC6E82BC74D526DFDEBE858D21C611625B8D1EFC0F9B7C1421169C876AF4DCE6E64B719F231E918C6322C339253A43A1586FE12315A851BE84325F99A4FE3F9184692E1ED9CE16C7BED8E1089E3270086FB4C23B6C289A8A01E90AD54371A60FEEB4F8CA84A1BC80C57BC11841B94A104C79853924C11CC449F978ABF2452048CFA4DEF164E705CE4339CCD77881E313E3B342BDE18ECF44AD78D5E24B426804913B1966EA39E74E0C2E9490E7CB88272AD3F5BDA0B616E8900FCAB0629FE58B579312220DED32A94959874715DC84AF03F55E2F8AF6D89723C8DDED99C371698DDF8A5FC263F54608B99027D5CCB07F36F88E67D82083BFDBA7AA9C488552AF6D28B5A4E729455EC80A2C1D049301138C92220653DEBE658DA0D18BC8CDCAB498053D6597CF0DBCE7A4F864C540B227C50BB3EFDB15B788E2CCCD35B39D60112E92A66055A9DD52119C8A7AA19D04AA5EEFB07E1636122AEA887642F09364D05AF2CCDB57BABB52DBF85142D8D8161128E3F3F572D131DAAAA2B4C0F20C83884F5B92A58F835C35702E0B743FB9561CFBCFF375947F5B73C1313F230F71FBDF19938C4D31B8AE778B6BB9D6321BBCF0E1F8FD9742DF9BA9383F95B45C09C9C4DEBFB6D6A9B9ACFE64685E0B4466A8EE58F0D8210DF1F24F03A8770568BEC46EF8270BDF111F0D957E26C31ABA0B246CB6062BA1D6D9B057573F33F3FCC99FC80D2D55D037BCA406BEE9CB72320F660EBE454033AA4C600387A2AD7EC3C016CA1F375FC9A253730FB9050C65FC2985BAB2D22264831632BFB8ED7FB5C40E6A0982608E11F64CA660B8DFAA5CAB7FBDD9F0D15635CF0AE9521F7F7000B55D1D4B5D146E096C9BEB7B34C8E0D59D1652D7A009FC2F216472E8D4322F6276C9FD68A86E4F3863E0EFE5E34E4831A166E16BCEC9B42FE6BC23DDC9BBDA3946A9392BA64CBA2522ACE1730D5B6B53A163C0EDBA933FA102C44D40BD7C2A6A78C449D8C18A081F6DE66B29F591001610239ABC99306FADD55E0A25A5D80B224FE22B2DE8799BAE87E82CF44AEA4C3D46D3B55669F21DA0F7A9E89B9C0CB7C207323E690EE07ACB5BBDE45BAD3791AE1C3746661E5047E2E138CBEFD4E70FC9D28079D456DCB1A0D04DA24B2CFA830304D163CC1589D4D03124113499BEBB605CD3000EB999F9AFC9E8B659FEE36A22696A42590F5954805E8704B50D0F2733C733EBF3A025C50ABB319F2D48FB523CC0A031B739D09A4B0233C6E879B24C75891135C7F1380437D03128C49C2B10BCCEC1E47081C30326652AFDCA2FA310CD3C80927637C0E980C6355D86697EDC1D161EC6C6E29D709C3D407011D8538C75BC01CC56E595257A99D7BE60D9FEF8DAF0F554C56630C2ABC5EDB0885198A43EA78DBDB1EBACAC4BC8379FDB59F174BE99E012F90345A09F32AC283A71CBE6F2F99C0C5E512194F0F802BAB1CEFA3274E3C8EE321F363BA5AA06694504F40A838E49875F273C9DCB771AE3A2BDA3F90C83A76CE6D7E3D5088B16CBE0A863F088426ECCFC8D17324B9C2E3C4FC6ADBF334134208409735C3804A183D17B59110CB04DC123A3952082A725CB1A516C801F433951909619C28C9B32BA6B6FF7C6EE76B4B56F81C7BD509B0F4AA1C9FFFC5E31C794BDD599F950C3818341A0856A50E71AADD5CDAA150EA8B6C1FDA94B15CFECDB882878DED906CBC02053FE5A699FE41F100EF9073BAEA4113869C690F25C3F22554134BF539B4FD8E150BD18025EAD9AE49A981D8CF1FC30240B2CAB3917E8C029A2443C005F7EF9A99AE7B864561D9ACA25B5016929F64EDF2FE7DB3A7F2CCCB79379FB8471BD9A67AF899931446AFA4E89106235FFE05E2FCD170F52DB401280116175A2D3C33C1CBE5A4B9BA95DD38C9AC57806FB0D6C3FDB8D46474EA4BBD39A234270F17D8931C27A9928635B8B1DE76A28B757550DEBEF36F1767BCD7B49C5928102C4FB5A0AFE3F35C2BF5136C89756E9531E9F4DB8B9C0BE2034D4D7AD40BF16789EA85BB23E38C16967C544EAD738A846E0C86DA2E9A86BB49F0E41E911B0F27B2C28319585CC2CAAC7E90C354EB9A80B5747E6B0F49A6A80318413178DF1D3C6D8C783559BD8FCE7E1A6F2DB51DD8CB67BFCFA26FDF62C1CA9D4A7FB1DE4B68428BD7DAF67CE1B6AEAAB1ACDA1F51A351288715526AC75E7E2D2EC5CA3085E9F0D1476BE1A4700BBBBE4912106551CA7F989C2C6EB665892A5DE37052CC4044D4B1238588CED1AE133CC4189DEB06CF655B294508431DB42ABBA5E56DB46399D5DA238A31B79122142F4BC55B51B1B29A28841B138CBD867758927B3FD3CF7B1CCD4689E791FB5DA07BA358494769DB29D5217254C96A6762D637291B91D01E60FBA75166CD68AB9EF975FF79DF98F72CA3251366FCBF929D038389BC56644342D6ED429932381800F2A2D790A7B517495ACF985973E461A480EAFE6947B52FBD3AAF0F8DA9C48426D30C1354CBF6784D8130F83619F43B19D4789139B4C7E56B41A0F5F6EAC71F77B11AB9EB04EEE0369CF60975EA12F2B29AFCFE2C06A8488C47E712CBFF5E9F1B659187CDAD6D21C856ADE039F7D60AB2FB6CA05B7E7BA3D2DF23A53E1C80E1B556CD7447AE411F798334AD5F89A302803742DEA852D23CF35003F39B1CA241F87169EC325A49609A01E5F7F5A85DB384D428B88A971779A185CA51AE49E8C9238E48A065A9F854B1E4B95400C5BD7A77B6958ECCC289F4FBD192C977264BD813DEF11D078C96EF9793F2E106FBD0AD01E64899A6D20226C465F49F022AAF938669E2B42911263600000);

-- ----------------------------
-- Table structure for studys_user
-- ----------------------------
DROP TABLE IF EXISTS `studys_user`;
CREATE TABLE `studys_user` (
  `id` int(6) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(32) NOT NULL COMMENT '用户名',
  `user_password` char(32) NOT NULL COMMENT '密码',
  `education` varchar(16) NOT NULL COMMENT '学历',
  `telphone` char(11) NOT NULL COMMENT '联系方式',
  `email` varchar(64) NOT NULL COMMENT '邮箱',
  `create_time` date NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studys_user
-- ----------------------------
INSERT INTO `studys_user` VALUES ('100003', '小乔1', '123456', '本科', '14789653244', '963145127@qq.com', '2021-03-01');
INSERT INTO `studys_user` VALUES ('1', '小乔1', '456654', '本科', '14789653245', '963245127@qq.com', '2021-03-02');

-- ----------------------------
-- Table structure for studys_user_resource
-- ----------------------------
DROP TABLE IF EXISTS `studys_user_resource`;
CREATE TABLE `studys_user_resource` (
  `user_id` int(6) NOT NULL COMMENT '用户ID',
  `re_number` int(6) NOT NULL COMMENT '资源编号',
  `add_time` date NOT NULL COMMENT '添加时间',
  `lstart_time` datetime NOT NULL COMMENT '开始学习时间',
  `lstop_time` datetime NOT NULL COMMENT '结束学习时间',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studys_user_resource
-- ----------------------------
INSERT INTO `studys_user_resource` VALUES ('100001', '812001', '2021-03-02', '2021-03-03 09:30:00', '2021-03-03 10:00:00');
INSERT INTO `studys_user_resource` VALUES ('100002', '812001', '2021-03-03', '2021-03-03 10:30:00', '2021-03-03 11:00:00');

-- ----------------------------
-- Table structure for studys_visitor
-- ----------------------------
DROP TABLE IF EXISTS `studys_visitor`;
CREATE TABLE `studys_visitor` (
  `visitor_id` int(6) NOT NULL AUTO_INCREMENT COMMENT '游客随机id',
  `visit_time` date NOT NULL COMMENT '访问时间',
  PRIMARY KEY (`visitor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1501 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studys_visitor
-- ----------------------------
INSERT INTO `studys_visitor` VALUES ('1500', '2021-03-20');

-- ----------------------------
-- Table structure for study_re_part
-- ----------------------------
DROP TABLE IF EXISTS `study_re_part`;
CREATE TABLE `study_re_part` (
  `part_num` int(6) NOT NULL AUTO_INCREMENT COMMENT '类别编号',
  `part_name` varchar(32) NOT NULL COMMENT '类别名称',
  PRIMARY KEY (`part_num`)
) ENGINE=MyISAM AUTO_INCREMENT=810003 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of study_re_part
-- ----------------------------
INSERT INTO `study_re_part` VALUES ('810001', '程序设计资源--C++');
INSERT INTO `study_re_part` VALUES ('810002', '考研公共课资源--数学');
