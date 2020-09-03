class PickerData {
  static const List<String> personalConditionKeys = [
    '年龄',
    '籍贯',
    '居住地',
    '职业',
    '身高',
    '学历',
    '月收入',
    '婚姻状况',
    '购车情况',
    '是否想要孩子',
    '何时结婚',
  ];

  static const List<String> findConditionKeys = [
    '年龄',
    '籍贯',
    '居住地',
    '职业',
    '身高',
    '学历',
    '月收入',
    '婚姻状况',
    '购车情况',
    '是否想要孩子',
    '是否抽烟',
    '是否喝酒',
    '何时结婚',
  ];

  static const RANGE_AGES = ['18岁-26岁','27岁-33岁','34岁-40岁','41岁-45岁','46岁-50岁'];
  static const EDUCATIONS = ['小学', '初中', '高州', '大专', '本科', '硕士', '博士'];
  static const MARRIED = ['未婚', '已婚', '离异', '丧偶'];
  static const CARS = ['已购车', '未购车'];
  static const NEED_CHILD = ['可以接受', '暂时不考虑'];
  static const SMOKING = ['是', '否', '偶尔'];
  static const DRINKING = ['是', '否', '偶尔'];
  static const MARRIED_TIME = ['1年内', '2年内', '3年内', '5年内'];
  static const OCCUPATIONAL = [
    '销售',
    '客户服务',
    '计算机/互联网',
    '通信/电子',
    '生产/制造',
    '物流/仓储',
    '商贸/采购',
    '人事/行政',
    '高级管理',
    '广告/市场',
    '传媒/艺术',
    '生物/制药',
    '医疗/护理',
    '金融/银行/保险',
    '建筑/房地产',
    '咨询/顾问',
    '法律',
    '财会/审计',
    '教育/科研',
    '服务业',
    '交通运输',
    '政府机构',
    '军人/警察',
    '农林牧渔',
    '自由职业',
    '在校学生',
    '其他',
  ];

  static List<String> getPickerData(int index) {
    switch (index) {
      case 0:
        List<String> ages = [];
        for (int i = 18; i < 61; i++) {
          ages.add('$i岁');
        }
        return ages;
      case 3:
        return OCCUPATIONAL;
      case 4:
        List<String> heights = [];
        for (int i = 145; i < 181; i++) {
          if (i == 180) {
            heights.add('$i cm以上');
          } else {
            heights.add('$i cm');
          }
        }
        return heights;
      case 5:
        return PickerData.EDUCATIONS;
      case 7:
        return PickerData.MARRIED;
      case 8:
        return PickerData.CARS;
      case 9:
        return PickerData.NEED_CHILD;
      case 10:
        return PickerData.MARRIED_TIME;
    }
  }

  static List<String> getMutiPickerData(int index) {
    switch (index) {
      case 0:
        return RANGE_AGES;
      case 3:
        return OCCUPATIONAL;
      case 4:
        List<String> heights = [];
        for (int i = 145; i < 181; i++) {
          if (i == 180) {
            heights.add('$i cm以上');
          } else {
            heights.add('$i cm');
          }
        }
        return heights;
      case 5:
        return PickerData.EDUCATIONS;
      case 7:
        return PickerData.MARRIED;
      case 8:
        return PickerData.CARS;
      case 9:
        return PickerData.NEED_CHILD;
      case 10:
        return PickerData.SMOKING;
      case 11:
        return PickerData.DRINKING;
      case 12:
        return PickerData.MARRIED_TIME;
    }
  }

  static List<List<String>> generateIncome() {
    List<List<String>> income = [];
    List<String> one = [];
    List<String> two = [];
    for (int i = 2; i < 51; i++) {
      one.add('$i k');
      if(i < 50) {
        two.add('${i + 1} k');
      }
    }
    income.add(one);
    income.add(two);
    return income;
  }

}
