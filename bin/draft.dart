import 'dart:io';

void main() {
  const template =
      '/summon armor_stand ~ ~ ~ {ShowArms:1b,ArmorItems:[{},{},{},{}],HandItems:[{id:"\$item",Count:64b, tag:{\$ench}}]}';

  while (true) {
    stdout.write('Item :: ');
    var item = stdin.readLineSync()!;

    stdout.write('Ench :: ');
    var rawEnch = stdin.readLineSync()!;
    var ench = rawEnch.substring(0, rawEnch.length - 1);
    print(ench);

    stdout.write(
        'Result ::\n${template.replaceFirst("\$item", item).replaceFirst("\$ench", ench)}\n\n');
  }

  //print('/summon armor_stand ~ ~ ~ {ShowArms:1b,ArmorItems:[{},{},{},{}],HandItems:[{id:"diamond_sword{Enchantments:[{id:unbreaking,lvl:1}]}",Count:64b},{}]}')
}
