import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:depi_final_project/ui/home_screen/taps/vault_tap/cubits/vault_cubit.dart';
import 'package:depi_final_project/ui/home_screen/taps/vault_tap/cubits/vault_state.dart';
import 'package:depi_final_project/ui/home_screen/taps/vault_tap/widgets/filter_tabs.dart';
import 'package:depi_final_project/ui/home_screen/taps/vault_tap/widgets/vault_embty_state.dart';
import 'package:depi_final_project/ui/home_screen/taps/vault_tap/widgets/vault_state_card.dart';
import 'package:depi_final_project/ui/home_screen/taps/vault_tap/widgets/word_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class VocablaryVault extends StatelessWidget {
  const VocablaryVault({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => VaultCubit(),
     child: const _VaultView(),);
  }
}

class _VaultView extends StatelessWidget {
  const _VaultView();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VaultCubit>();
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: BlocBuilder<VaultCubit, VaultState>(
          builder: (context, state) {
            return ListView(
              padding: EdgeInsets.fromLTRB(20, 12, 20, 24),
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Vocabulary Vault",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: AppColor.dark,
                        ),
                      ),
                    ),
                     
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColor.divider,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColor.border),
                      ),
                      child: Icon(Icons.tune, size: 18),
                    ),
                  ],
                ),
                      VaultStateCard(
                  total: state.total,
                  mastered: state.mastered,
                  due: state.due,
                  onStartReview: (){
                    ////
                  },
                ),
               SizedBox(height: 16,),
                      if(state.words.isEmpty)
                      VaultEmbtyState(onStartConversation:(){
                        /////
                      })
                      else ...[
                        FilterTabs(
                          selected:state.filiter,
                          onChanged:cubit.changeFilter,
                        )
                      ],
                      SizedBox(height: 16,),

                Container(
                  decoration: BoxDecoration(
                    color: AppColor.surface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColor.border,),
                  ),
                  child: Column(children: [
                          for(var i=0; i< state.visible.length; i++) ...[
                             if(i>0)
                             const Divider(height: 1,
                             color: AppColor.divider,),
                             WordTile(
                              word:state.visible[i],
                              strength:0,
                              onSpeak:()=>cubit.speak(state.visible[i].word),
                              onTap: (){
                                /////
                              },
                             )
                          ]
                         ],
                       ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
