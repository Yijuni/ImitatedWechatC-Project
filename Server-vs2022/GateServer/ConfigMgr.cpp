#include "ConfigMgr.h"
ConfigMgr::ConfigMgr() {
	boost::filesystem::path current_path = boost::filesystem::current_path();
	boost::filesystem::path config_path = current_path / "config.ini";
	std::cout << " Config path is " << config_path << std::endl;

	boost::property_tree::ptree  pt;
	boost::property_tree::read_ini(config_path.string(), pt);//读取ini文件格式，按照树的方式读入pt
	
	for (const auto& section_pair : pt) {
		const std::string& section_name = section_pair.first;//section的名字也就是[]里的那个
		const boost::property_tree::ptree& section_tree = section_pair.second;
		std::map<std::string, std::string> section_config;//一个section的map，管理类有多个section的map
		for (const auto& key_value_pair : section_tree) {
			const std::string& key = key_value_pair.first;
			const std::string& value = key_value_pair.second.get_value<std::string>();
		    section_config[key] = value;
		}
		SectionInfo sectioninfo; 
		sectioninfo._section_datas = section_config;
		_config_map[section_name] = sectioninfo;
	}
	// 输出所有的section和key-value对  
	for (const auto& section_entry : _config_map) {
		const std::string& section_name = section_entry.first;
		SectionInfo section_config = section_entry.second;
		std::cout << "[" << section_name << "]" << std::endl;
		for (const auto& key_value_pair : section_config._section_datas) {
			std::cout << key_value_pair.first << "=" << key_value_pair.second << std::endl;
		}
	}
}