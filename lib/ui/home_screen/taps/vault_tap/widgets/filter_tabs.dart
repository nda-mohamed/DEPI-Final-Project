

import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:depi_final_project/ui/home_screen/taps/vault_tap/cubits/vault_state.dart';
import 'package:flutter/material.dart';

class FilterTabs extends StatelessWidget {
  final VaultFilter selected;
  final ValueChanged<VaultFilter> onChanged;
  const FilterTabs({super.key, required this.selected, required this.onChanged, });

static const _labels ={
  VaultFilter.all:'All',
  VaultFilter.learning:'Learning',
  VaultFilter.mastered:'Mastered',
};

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColor.secondary1,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(children: 
        VaultFilter.values.map((f){
          final isSelected = f== selected;
            return Expanded(
              child: GestureDetector(
                onTap: ()=>onChanged(f),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200) ,
                 padding: const EdgeInsets.symmetric(vertical: 10),
                 decoration: BoxDecoration(
                  color: isSelected ? AppColor.surface : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  border: isSelected
                      ? Border.all(color: AppColor.border)
                      : null,
                ),
                child: Text(
                  _labels[f]!,
                  textAlign: TextAlign.center,
                  style:TextStyle(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: isSelected
                        ? AppColor.textPrimary
                        : AppColor.gray1,
                  ), 
                ),
                ),
              )
              
              ,);
        }).toList(),
      )
    );
    
    
  }
}