export default {
  // 根据DictID及FullDict获取对应数据字典
  getDict: function (fullDict, dictId) {
    const thisDict = []
    for (let i = 0; i < fullDict.length; i++) {
      if (fullDict[i].dictId === dictId) {
        thisDict.push(fullDict[i])
      }
    }
    return thisDict
  },
  // 根据Dict(只包含一本字典)及dictKey获取dictName
  getValueByKey: function (dict, dictKey) {
    for (let i = 0; i < dict.length; i++) {
      if (dict[i].dictKey === dictKey) {
        return dict[i].dictValue
      }
    }
  }
}
