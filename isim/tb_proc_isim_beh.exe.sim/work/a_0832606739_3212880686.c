/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//vboxsrv/Desktop/processor/alu.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
char *ieee_p_2592010699_sub_1735675855_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_3293060193_503743352(char *, char *, char *, char *, unsigned char );
char *ieee_p_2592010699_sub_393209765_503743352(char *, char *, char *, char *);
char *ieee_p_2592010699_sub_795620321_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767740470_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_0832606739_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(37, ng0);

LAB3:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 1512U);
    t3 = *((char **)t1);
    t1 = (t0 + 5480U);
    t4 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t3, t1);
    t5 = (t4 - 7);
    t6 = (t5 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t4);
    t7 = (1U * t6);
    t8 = (0 + t7);
    t9 = (t2 + t8);
    t10 = *((unsigned char *)t9);
    t11 = (t0 + 3656);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = t10;
    xsi_driver_first_trans_fast(t11);

LAB2:    t16 = (t0 + 3560);
    *((int *)t16) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0832606739_3212880686_p_1(char *t0)
{
    char t36[16];
    char t51[16];
    char t53[16];
    char t55[16];
    char t57[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    int t11;
    char *t12;
    char *t13;
    int t14;
    char *t15;
    char *t16;
    int t17;
    char *t18;
    char *t19;
    int t20;
    char *t21;
    char *t22;
    int t23;
    char *t24;
    char *t25;
    int t26;
    char *t27;
    char *t28;
    int t29;
    char *t30;
    int t32;
    char *t33;
    int t35;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    unsigned char t45;
    char *t46;
    char *t47;
    char *t48;
    char *t49;
    char *t50;
    unsigned char t52;
    unsigned char t54;
    unsigned char t56;
    unsigned int t58;
    unsigned int t59;
    unsigned char t60;

LAB0:    t1 = (t0 + 3240U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(39, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 5549);
    t5 = xsi_mem_cmp(t2, t3, 4U);
    if (t5 == 1)
        goto LAB5;

LAB17:    t6 = (t0 + 5553);
    t8 = xsi_mem_cmp(t6, t3, 4U);
    if (t8 == 1)
        goto LAB6;

LAB18:    t9 = (t0 + 5557);
    t11 = xsi_mem_cmp(t9, t3, 4U);
    if (t11 == 1)
        goto LAB7;

LAB19:    t12 = (t0 + 5561);
    t14 = xsi_mem_cmp(t12, t3, 4U);
    if (t14 == 1)
        goto LAB8;

LAB20:    t15 = (t0 + 5565);
    t17 = xsi_mem_cmp(t15, t3, 4U);
    if (t17 == 1)
        goto LAB9;

LAB21:    t18 = (t0 + 5569);
    t20 = xsi_mem_cmp(t18, t3, 4U);
    if (t20 == 1)
        goto LAB10;

LAB22:    t21 = (t0 + 5573);
    t23 = xsi_mem_cmp(t21, t3, 4U);
    if (t23 == 1)
        goto LAB11;

LAB23:    t24 = (t0 + 5577);
    t26 = xsi_mem_cmp(t24, t3, 4U);
    if (t26 == 1)
        goto LAB12;

LAB24:    t27 = (t0 + 5581);
    t29 = xsi_mem_cmp(t27, t3, 4U);
    if (t29 == 1)
        goto LAB13;

LAB25:    t30 = (t0 + 5585);
    t32 = xsi_mem_cmp(t30, t3, 4U);
    if (t32 == 1)
        goto LAB14;

LAB26:    t33 = (t0 + 5589);
    t35 = xsi_mem_cmp(t33, t3, 4U);
    if (t35 == 1)
        goto LAB15;

LAB27:
LAB16:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 5597);
    t4 = (t0 + 3720);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast_port(t4);

LAB4:    xsi_set_current_line(39, ng0);

LAB53:    t2 = (t0 + 3576);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB54;

LAB1:    return;
LAB5:    xsi_set_current_line(40, ng0);
    t37 = (t0 + 1032U);
    t38 = *((char **)t37);
    t37 = (t0 + 5432U);
    t39 = (t0 + 1192U);
    t40 = *((char **)t39);
    t39 = (t0 + 5448U);
    t41 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t36, t38, t37, t40, t39);
    t42 = (t36 + 12U);
    t43 = *((unsigned int *)t42);
    t44 = (1U * t43);
    t45 = (8U != t44);
    if (t45 == 1)
        goto LAB29;

LAB30:    t46 = (t0 + 3720);
    t47 = (t46 + 56U);
    t48 = *((char **)t47);
    t49 = (t48 + 56U);
    t50 = *((char **)t49);
    memcpy(t50, t41, 8U);
    xsi_driver_first_trans_fast_port(t46);
    goto LAB4;

LAB6:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5432U);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 5448U);
    t7 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t36, t3, t2, t6, t4);
    t9 = (t36 + 12U);
    t43 = *((unsigned int *)t9);
    t44 = (1U * t43);
    t45 = (8U != t44);
    if (t45 == 1)
        goto LAB31;

LAB32:    t10 = (t0 + 3720);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 8U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB4;

LAB7:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5432U);
    t4 = (t0 + 1512U);
    t6 = *((char **)t4);
    t4 = (t0 + 5480U);
    t7 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t36, t3, t2, t6, t4);
    t9 = (t36 + 12U);
    t43 = *((unsigned int *)t9);
    t44 = (1U * t43);
    t45 = (8U != t44);
    if (t45 == 1)
        goto LAB33;

LAB34:    t10 = (t0 + 3720);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 8U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB4;

LAB8:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5432U);
    t4 = (t0 + 1512U);
    t6 = *((char **)t4);
    t4 = (t0 + 5480U);
    t7 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t36, t3, t2, t6, t4);
    t9 = (t36 + 12U);
    t43 = *((unsigned int *)t9);
    t44 = (1U * t43);
    t45 = (8U != t44);
    if (t45 == 1)
        goto LAB35;

LAB36:    t10 = (t0 + 3720);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 8U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB4;

LAB9:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5432U);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 5448U);
    t7 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t36, t3, t2, t6, t4);
    t9 = (t36 + 12U);
    t43 = *((unsigned int *)t9);
    t44 = (1U * t43);
    t45 = (8U != t44);
    if (t45 == 1)
        goto LAB37;

LAB38:    t10 = (t0 + 3720);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 8U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB4;

LAB10:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5432U);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 5448U);
    t7 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t36, t3, t2, t6, t4);
    t9 = (t36 + 12U);
    t43 = *((unsigned int *)t9);
    t44 = (1U * t43);
    t45 = (8U != t44);
    if (t45 == 1)
        goto LAB39;

LAB40:    t10 = (t0 + 3720);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 8U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB4;

LAB11:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5432U);
    t4 = (t0 + 1512U);
    t6 = *((char **)t4);
    t4 = (t0 + 5480U);
    t7 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t36, t3, t2, t6, t4);
    t9 = (t36 + 12U);
    t43 = *((unsigned int *)t9);
    t44 = (1U * t43);
    t45 = (8U != t44);
    if (t45 == 1)
        goto LAB41;

LAB42:    t10 = (t0 + 3720);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 8U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB4;

LAB12:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5432U);
    t4 = (t0 + 1512U);
    t6 = *((char **)t4);
    t4 = (t0 + 5480U);
    t7 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t36, t3, t2, t6, t4);
    t9 = (t36 + 12U);
    t43 = *((unsigned int *)t9);
    t44 = (1U * t43);
    t45 = (8U != t44);
    if (t45 == 1)
        goto LAB43;

LAB44:    t10 = (t0 + 3720);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 8U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB4;

LAB13:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5432U);
    t4 = ieee_p_2592010699_sub_3293060193_503743352(IEEE_P_2592010699, t51, t3, t2, (unsigned char)0);
    t6 = (t51 + 12U);
    t43 = *((unsigned int *)t6);
    t43 = (t43 * 1U);
    t7 = (t0 + 1512U);
    t9 = *((char **)t7);
    t7 = (t0 + 5480U);
    t5 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t9, t7);
    t10 = xsi_vhdl_bitvec_sll(t10, t4, t43, t5);
    t12 = ieee_p_2592010699_sub_393209765_503743352(IEEE_P_2592010699, t36, t10, t51);
    t13 = (t36 + 12U);
    t44 = *((unsigned int *)t13);
    t44 = (t44 * 1U);
    t45 = (8U != t44);
    if (t45 == 1)
        goto LAB45;

LAB46:    t15 = (t0 + 3720);
    t16 = (t15 + 56U);
    t18 = *((char **)t16);
    t19 = (t18 + 56U);
    t21 = *((char **)t19);
    memcpy(t21, t12, 8U);
    xsi_driver_first_trans_fast_port(t15);
    goto LAB4;

LAB14:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5432U);
    t4 = ieee_p_2592010699_sub_3293060193_503743352(IEEE_P_2592010699, t51, t3, t2, (unsigned char)0);
    t6 = (t51 + 12U);
    t43 = *((unsigned int *)t6);
    t43 = (t43 * 1U);
    t7 = (t0 + 1512U);
    t9 = *((char **)t7);
    t7 = (t0 + 5480U);
    t5 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t9, t7);
    t10 = xsi_vhdl_bitvec_sra(t10, t4, t43, t5);
    t12 = ieee_p_2592010699_sub_393209765_503743352(IEEE_P_2592010699, t36, t10, t51);
    t13 = (t36 + 12U);
    t44 = *((unsigned int *)t13);
    t44 = (t44 * 1U);
    t45 = (8U != t44);
    if (t45 == 1)
        goto LAB47;

LAB48:    t15 = (t0 + 3720);
    t16 = (t15 + 56U);
    t18 = *((char **)t16);
    t19 = (t18 + 56U);
    t21 = *((char **)t19);
    memcpy(t21, t12, 8U);
    xsi_driver_first_trans_fast_port(t15);
    goto LAB4;

LAB15:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 5593);
    t4 = (t0 + 1832U);
    t6 = *((char **)t4);
    t45 = *((unsigned char *)t6);
    t7 = ((IEEE_P_2592010699) + 4024);
    t9 = (t51 + 0U);
    t10 = (t9 + 0U);
    *((int *)t10) = 0;
    t10 = (t9 + 4U);
    *((int *)t10) = 3;
    t10 = (t9 + 8U);
    *((int *)t10) = 1;
    t5 = (3 - 0);
    t43 = (t5 * 1);
    t43 = (t43 + 1);
    t10 = (t9 + 12U);
    *((unsigned int *)t10) = t43;
    t4 = xsi_base_array_concat(t4, t36, t7, (char)97, t2, t51, (char)99, t45, (char)101);
    t10 = (t0 + 1832U);
    t12 = *((char **)t10);
    t52 = *((unsigned char *)t12);
    t13 = ((IEEE_P_2592010699) + 4024);
    t10 = xsi_base_array_concat(t10, t53, t13, (char)97, t4, t36, (char)99, t52, (char)101);
    t15 = (t0 + 1832U);
    t16 = *((char **)t15);
    t54 = *((unsigned char *)t16);
    t18 = ((IEEE_P_2592010699) + 4024);
    t15 = xsi_base_array_concat(t15, t55, t18, (char)97, t10, t53, (char)99, t54, (char)101);
    t19 = (t0 + 1832U);
    t21 = *((char **)t19);
    t56 = *((unsigned char *)t21);
    t22 = ((IEEE_P_2592010699) + 4024);
    t19 = xsi_base_array_concat(t19, t57, t22, (char)97, t15, t55, (char)99, t56, (char)101);
    t43 = (4U + 1U);
    t44 = (t43 + 1U);
    t58 = (t44 + 1U);
    t59 = (t58 + 1U);
    t60 = (8U != t59);
    if (t60 == 1)
        goto LAB49;

LAB50:    t24 = (t0 + 3720);
    t25 = (t24 + 56U);
    t27 = *((char **)t25);
    t28 = (t27 + 56U);
    t30 = *((char **)t28);
    memcpy(t30, t19, 8U);
    xsi_driver_first_trans_fast_port(t24);
    goto LAB4;

LAB28:;
LAB29:    xsi_size_not_matching(8U, t44, 0);
    goto LAB30;

LAB31:    xsi_size_not_matching(8U, t44, 0);
    goto LAB32;

LAB33:    xsi_size_not_matching(8U, t44, 0);
    goto LAB34;

LAB35:    xsi_size_not_matching(8U, t44, 0);
    goto LAB36;

LAB37:    xsi_size_not_matching(8U, t44, 0);
    goto LAB38;

LAB39:    xsi_size_not_matching(8U, t44, 0);
    goto LAB40;

LAB41:    xsi_size_not_matching(8U, t44, 0);
    goto LAB42;

LAB43:    xsi_size_not_matching(8U, t44, 0);
    goto LAB44;

LAB45:    xsi_size_not_matching(8U, t44, 0);
    goto LAB46;

LAB47:    xsi_size_not_matching(8U, t44, 0);
    goto LAB48;

LAB49:    xsi_size_not_matching(8U, t59, 0);
    goto LAB50;

LAB51:    t3 = (t0 + 3576);
    *((int *)t3) = 0;
    goto LAB2;

LAB52:    goto LAB51;

LAB54:    goto LAB52;

}


extern void work_a_0832606739_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0832606739_3212880686_p_0,(void *)work_a_0832606739_3212880686_p_1};
	xsi_register_didat("work_a_0832606739_3212880686", "isim/tb_proc_isim_beh.exe.sim/work/a_0832606739_3212880686.didat");
	xsi_register_executes(pe);
}
