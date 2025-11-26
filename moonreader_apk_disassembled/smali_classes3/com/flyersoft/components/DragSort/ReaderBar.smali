.class public Lcom/flyersoft/components/DragSort/ReaderBar;
.super Ljava/lang/Object;
.source "ReaderBar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/DragSort/ReaderBar$MainListAdapter;
    }
.end annotation


# static fields
.field public static final COUNT:I = 0x15

.field public static final CUSTOM_BUTTON:I = 0x11

.field static doubleLineBar:Z = false

.field static sortButtons:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/DragSort/SortItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$smrenderLayout(Landroid/view/View;Z)V
    .locals 0

    invoke-static {p0, p1}, Lcom/flyersoft/components/DragSort/ReaderBar;->renderLayout(Landroid/view/View;Z)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addReaderBarButton(Landroid/widget/LinearLayout;Lcom/flyersoft/components/DragSort/SortItem;)V
    .locals 3

    .line 317
    new-instance v0, Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 318
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    if-eqz p1, :cond_0

    .line 320
    iget p1, p1, Lcom/flyersoft/components/DragSort/SortItem;->index:I

    invoke-static {p1}, Lcom/flyersoft/components/DragSort/ReaderBar;->bIcon(I)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 321
    :cond_0
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v1, 0x40a00000    # 5.0f

    const/4 v2, -0x1

    invoke-direct {p1, v2, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p0, v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public static bIcon(I)I
    .locals 0

    packed-switch p0, :pswitch_data_0

    const/4 p0, 0x0

    return p0

    .line 80
    :pswitch_0
    sget p0, Lcom/flyersoft/moonreaderp/R$drawable;->rulerbutton:I

    return p0

    .line 79
    :pswitch_1
    sget p0, Lcom/flyersoft/moonreaderp/R$drawable;->sync_download:I

    return p0

    .line 78
    :pswitch_2
    sget p0, Lcom/flyersoft/moonreaderp/R$drawable;->sync_upload:I

    return p0

    .line 77
    :pswitch_3
    sget p0, Lcom/flyersoft/moonreaderp/R$drawable;->customize_bar:I

    return p0

    .line 76
    :pswitch_4
    sget p0, Lcom/flyersoft/moonreaderp/R$drawable;->dualpage:I

    return p0

    .line 75
    :pswitch_5
    sget p0, Lcom/flyersoft/moonreaderp/R$drawable;->shutdown:I

    return p0

    .line 74
    :pswitch_6
    sget p0, Lcom/flyersoft/moonreaderp/R$drawable;->options:I

    return p0

    .line 73
    :pswitch_7
    sget p0, Lcom/flyersoft/moonreaderp/R$drawable;->themesdlg:I

    return p0

    .line 72
    :pswitch_8
    sget p0, Lcom/flyersoft/moonreaderp/R$drawable;->miscellaneous:I

    return p0

    .line 71
    :pswitch_9
    sget p0, Lcom/flyersoft/moonreaderp/R$drawable;->controloptions:I

    return p0

    .line 70
    :pswitch_a
    sget p0, Lcom/flyersoft/moonreaderp/R$drawable;->visualoptions:I

    return p0

    .line 69
    :pswitch_b
    sget p0, Lcom/flyersoft/moonreaderp/R$drawable;->tilt:I

    return p0

    .line 68
    :pswitch_c
    sget p0, Lcom/flyersoft/moonreaderp/R$drawable;->search:I

    return p0

    .line 67
    :pswitch_d
    sget p0, Lcom/flyersoft/moonreaderp/R$drawable;->font:I

    return p0

    .line 66
    :pswitch_e
    sget p0, Lcom/flyersoft/moonreaderp/R$drawable;->brightness:I

    return p0

    .line 65
    :pswitch_f
    sget p0, Lcom/flyersoft/moonreaderp/R$drawable;->bookmark:I

    return p0

    .line 64
    :pswitch_10
    sget p0, Lcom/flyersoft/moonreaderp/R$drawable;->toc:I

    return p0

    .line 63
    :pswitch_11
    sget p0, Lcom/flyersoft/moonreaderp/R$drawable;->scrollstart:I

    return p0

    .line 62
    :pswitch_12
    sget p0, Lcom/flyersoft/moonreaderp/R$drawable;->speaker:I

    return p0

    .line 61
    :pswitch_13
    sget p0, Lcom/flyersoft/moonreaderp/R$drawable;->daynight:I

    return p0

    .line 60
    :pswitch_14
    sget p0, Lcom/flyersoft/moonreaderp/R$drawable;->screenorient:I

    return p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static bText(I)Ljava/lang/String;
    .locals 2

    .line 32
    const-string v0, "..."

    const-string v1, ""

    packed-switch p0, :pswitch_data_0

    return-object v1

    .line 53
    :pswitch_0
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->reading_ruler:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 52
    :pswitch_1
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->sync_from_cloud:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 51
    :pswitch_2
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->sync_to_cloud:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 50
    :pswitch_3
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->customize_bottom_bar1:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 49
    :pswitch_4
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->button_dualpage:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 48
    :pswitch_5
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->button_shutdown:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 47
    :pswitch_6
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->button_options:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 46
    :pswitch_7
    invoke-static {}, Lcom/flyersoft/tools/A;->getLangContext()Landroid/content/Context;

    move-result-object p0

    sget v0, Lcom/flyersoft/moonreaderp/R$array;->options_menu:I

    const/4 v1, 0x3

    invoke-static {p0, v0, v1}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 45
    :pswitch_8
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->miscellaneous:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 44
    :pswitch_9
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->control_options:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 43
    :pswitch_a
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->visual_options:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 42
    :pswitch_b
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->tilt_turn_page:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 41
    :pswitch_c
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->button_search:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 40
    :pswitch_d
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->button_fontsize:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 39
    :pswitch_e
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->button_brightness:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 38
    :pswitch_f
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->button_bookmarks:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 37
    :pswitch_10
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->button_chapters:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 36
    :pswitch_11
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->button_autoscroll:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 35
    :pswitch_12
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->button_speak:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 34
    :pswitch_13
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->button_daynight:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 33
    :pswitch_14
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->button_orientation:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static customizeBottomIcons(Landroid/content/Context;Z)Landroid/view/View;
    .locals 6

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    const/16 v1, 0x64

    .line 186
    sput v1, Lcom/flyersoft/tools/A;->hintBottomBarCount:I

    .line 187
    sget-boolean v1, Lcom/flyersoft/tools/A;->doubleLineBar:Z

    sput-boolean v1, Lcom/flyersoft/components/DragSort/ReaderBar;->doubleLineBar:Z

    .line 189
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->bottom_bar_sort:I

    invoke-virtual {v1, v2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 190
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cb:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    .line 191
    sget-boolean v2, Lcom/flyersoft/tools/A;->doubleLineBar:Z

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 192
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->recycler_view:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/components/DragSort/DragSortListLayout;

    .line 194
    invoke-static {}, Lcom/flyersoft/components/DragSort/ReaderBar;->getButtons()Ljava/util/ArrayList;

    move-result-object v3

    .line 195
    new-instance v4, Lcom/flyersoft/components/DragSort/ReaderBar$1;

    invoke-direct {v4, v0}, Lcom/flyersoft/components/DragSort/ReaderBar$1;-><init>(Landroid/view/View;)V

    .line 201
    new-instance v5, Lcom/flyersoft/components/DragSort/ReaderBar$MainListAdapter;

    invoke-direct {v5, p0, v3, v4}, Lcom/flyersoft/components/DragSort/ReaderBar$MainListAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;Lcom/flyersoft/tools/T$OnResult;)V

    .line 203
    invoke-virtual {v2, v5}, Lcom/flyersoft/components/DragSort/DragSortListLayout;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    if-nez p1, :cond_1

    const/4 p0, 0x0

    .line 206
    invoke-virtual {v0, p0, p0}, Landroid/view/View;->measure(II)V

    return-object v0

    .line 210
    :cond_1
    new-instance p1, Lcom/flyersoft/components/DragSort/ReaderBar$2;

    invoke-direct {p1, v0}, Lcom/flyersoft/components/DragSort/ReaderBar$2;-><init>(Landroid/view/View;)V

    invoke-virtual {v1, p1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 217
    sget-boolean p1, Lcom/flyersoft/tools/A;->doubleLineBar:Z

    invoke-static {v0, p1}, Lcom/flyersoft/components/DragSort/ReaderBar;->renderLayout(Landroid/view/View;Z)V

    .line 218
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->singleLay:I

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v2, Lcom/flyersoft/components/DragSort/ReaderBar$3;

    invoke-direct {v2, v0}, Lcom/flyersoft/components/DragSort/ReaderBar$3;-><init>(Landroid/view/View;)V

    invoke-virtual {p1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 224
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->doubleLay:I

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v2, Lcom/flyersoft/components/DragSort/ReaderBar$4;

    invoke-direct {v2, v0}, Lcom/flyersoft/components/DragSort/ReaderBar$4;-><init>(Landroid/view/View;)V

    invoke-virtual {p1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 231
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    invoke-direct {p1, p0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 232
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->customize_bottom_bar1:I

    invoke-virtual {p1, p0}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    .line 234
    new-instance p0, Lcom/flyersoft/components/DragSort/ReaderBar$5;

    invoke-direct {p0, v1, v3}, Lcom/flyersoft/components/DragSort/ReaderBar$5;-><init>(Landroid/widget/CheckBox;Ljava/util/ArrayList;)V

    const v1, 0x104000a

    invoke-virtual {p1, v1, p0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    .line 242
    new-instance p0, Lcom/flyersoft/components/DragSort/ReaderBar$6;

    invoke-direct {p0}, Lcom/flyersoft/components/DragSort/ReaderBar$6;-><init>()V

    const/high16 v1, 0x1040000

    invoke-virtual {p1, v1, p0}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    .line 248
    new-instance p0, Lcom/flyersoft/components/DragSort/ReaderBar$7;

    invoke-direct {p0}, Lcom/flyersoft/components/DragSort/ReaderBar$7;-><init>()V

    invoke-virtual {p1, p0}, Lcom/flyersoft/components/MyDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Lcom/flyersoft/components/MyDialog;

    .line 254
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 255
    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result p0

    if-eqz p0, :cond_2

    sget-boolean p0, Lcom/flyersoft/tools/A;->isTablet:Z

    if-nez p0, :cond_2

    .line 256
    iget-object p0, p1, Lcom/flyersoft/components/MyDialog;->dlg:Landroidx/appcompat/app/AlertDialog;

    invoke-static {p0}, Lcom/flyersoft/tools/A;->forceDialogImmersiveMode(Landroid/app/Dialog;)V

    :cond_2
    return-object v0
.end method

.method public static getButtons()Ljava/util/ArrayList;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/DragSort/SortItem;",
            ">;"
        }
    .end annotation

    .line 95
    sget-object v0, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    return-object v0

    .line 98
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    .line 99
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/reader_bar_icons"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFileText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->text2StringList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 101
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/16 v3, 0x12

    if-ne v2, v3, :cond_1

    .line 102
    const-string v2, "18*false"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 103
    const-string v2, "19*false"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 104
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0}, Lcom/flyersoft/tools/T;->stringList2Text(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/flyersoft/tools/T;->saveFileText(Ljava/lang/String;Ljava/lang/String;)Z

    .line 106
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/16 v4, 0x14

    if-ne v2, v4, :cond_2

    .line 107
    const-string v2, "20*false"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 108
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Lcom/flyersoft/tools/T;->stringList2Text(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/flyersoft/tools/T;->saveFileText(Ljava/lang/String;Ljava/lang/String;)Z

    .line 112
    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/16 v2, 0x15

    const/4 v5, 0x0

    if-lt v1, v2, :cond_6

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_3

    .line 114
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 115
    invoke-static {v6}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v8

    .line 116
    sget-object v13, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v7, Lcom/flyersoft/components/DragSort/SortItem;

    const-string v9, "*true"

    invoke-virtual {v6, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    invoke-static {v8}, Lcom/flyersoft/components/DragSort/ReaderBar;->bIcon(I)I

    move-result v10

    invoke-static {v8}, Lcom/flyersoft/components/DragSort/ReaderBar;->bText(I)Ljava/lang/String;

    move-result-object v11

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-direct/range {v7 .. v12}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v13, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 118
    :cond_3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 119
    sget-object v1, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/components/DragSort/SortItem;

    .line 120
    iget v7, v6, Lcom/flyersoft/components/DragSort/SortItem;->index:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 121
    iget v6, v6, Lcom/flyersoft/components/DragSort/SortItem;->index:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 122
    :cond_5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ne v0, v2, :cond_6

    goto/16 :goto_2

    .line 126
    :cond_6
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    .line 127
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "options1002"

    invoke-virtual {v0, v1, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 128
    sget-object v1, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    invoke-static {v5}, Lcom/flyersoft/components/DragSort/ReaderBar;->bIcon(I)I

    move-result v9

    invoke-static {v5}, Lcom/flyersoft/components/DragSort/ReaderBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    sget-object v1, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/4 v2, 0x1

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bIcon(I)I

    move-result v9

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v7, 0x1

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 130
    sget-object v1, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v8

    const/4 v2, 0x2

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bIcon(I)I

    move-result v9

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v7, 0x2

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 131
    sget-object v1, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/4 v2, 0x3

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bIcon(I)I

    move-result v9

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v7, 0x3

    const/4 v8, 0x1

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 132
    sget-object v1, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/4 v2, 0x4

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bIcon(I)I

    move-result v9

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v7, 0x4

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 133
    sget-object v1, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/4 v2, 0x5

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bIcon(I)I

    move-result v9

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v7, 0x5

    const/4 v8, 0x0

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 134
    sget-object v1, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/4 v2, 0x6

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bIcon(I)I

    move-result v9

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v7, 0x6

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 135
    sget-object v1, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/4 v2, 0x7

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bIcon(I)I

    move-result v9

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v7, 0x7

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 136
    sget-object v1, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/16 v2, 0x8

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bIcon(I)I

    move-result v9

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v7, 0x8

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 137
    sget-object v1, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/16 v2, 0x9

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bIcon(I)I

    move-result v9

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v7, 0x9

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 138
    sget-object v1, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/16 v2, 0xa

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bIcon(I)I

    move-result v9

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v7, 0xa

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 139
    sget-object v1, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/16 v2, 0xb

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bIcon(I)I

    move-result v9

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v7, 0xb

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 140
    sget-object v1, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/16 v2, 0xc

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bIcon(I)I

    move-result v9

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v7, 0xc

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 141
    sget-object v1, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/16 v2, 0xd

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bIcon(I)I

    move-result v9

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v7, 0xd

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 142
    sget-object v1, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/16 v2, 0xe

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bIcon(I)I

    move-result v9

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v7, 0xe

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 143
    sget-object v1, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/16 v2, 0xf

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bIcon(I)I

    move-result v9

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v7, 0xf

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 144
    sget-object v1, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/16 v2, 0x10

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bIcon(I)I

    move-result v9

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v7, 0x10

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 145
    sget-object v1, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/16 v2, 0x11

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bIcon(I)I

    move-result v9

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v7, 0x11

    const/4 v8, 0x1

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 146
    sget-object v1, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    invoke-static {v3}, Lcom/flyersoft/components/DragSort/ReaderBar;->bIcon(I)I

    move-result v9

    invoke-static {v3}, Lcom/flyersoft/components/DragSort/ReaderBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v7, 0x12

    const/4 v8, 0x0

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 147
    sget-object v1, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/16 v2, 0x13

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bIcon(I)I

    move-result v9

    invoke-static {v2}, Lcom/flyersoft/components/DragSort/ReaderBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v7, 0x13

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 148
    sget-object v1, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    invoke-static {v4}, Lcom/flyersoft/components/DragSort/ReaderBar;->bIcon(I)I

    move-result v9

    invoke-static {v4}, Lcom/flyersoft/components/DragSort/ReaderBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v7, 0x14

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 149
    sget-object v1, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    invoke-static {v1}, Lcom/flyersoft/components/DragSort/ReaderBar;->saveButtons(Ljava/util/ArrayList;)V

    .line 150
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "showOrientationButton"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "showDayNightButton"

    .line 151
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "showSpeakButton"

    .line 152
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "showAutoscrollButton"

    .line 153
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "showChapterButton"

    .line 154
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "showBookmarkButton2"

    .line 155
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "showBrightnessButton"

    .line 156
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "showFontSizeButton"

    .line 157
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "showSearchButton2"

    .line 158
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "showTiltButton"

    .line 159
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "showVisualButton"

    .line 160
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "showControlButton"

    .line 161
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "showMiscButton"

    .line 162
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "showOptionButton"

    .line 163
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "showShutDownButton"

    .line 164
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "hintForBottomBar"

    .line 165
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 166
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 168
    :goto_2
    sget-object v0, Lcom/flyersoft/components/DragSort/ReaderBar;->sortButtons:Ljava/util/ArrayList;

    return-object v0
.end method

.method private static renderLayout(Landroid/view/View;Z)V
    .locals 7

    .line 261
    sput-boolean p1, Lcom/flyersoft/components/DragSort/ReaderBar;->doubleLineBar:Z

    .line 262
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->cb:I

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 263
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const v1, 0x221e88e5

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 264
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/high16 v2, 0x33000000

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 265
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x17

    if-lt v2, v3, :cond_2

    .line 266
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->singleLay:I

    invoke-virtual {p0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    if-eqz p1, :cond_0

    move-object v3, v1

    goto :goto_0

    :cond_0
    move-object v3, v0

    :goto_0
    invoke-static {v2, v3}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 267
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->doubleLay:I

    invoke-virtual {p0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    if-eqz p1, :cond_1

    goto :goto_1

    :cond_1
    move-object v0, v1

    :goto_1
    invoke-static {v2, v0}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    goto :goto_4

    .line 269
    :cond_2
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->singleLay:I

    invoke-virtual {p0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    if-eqz p1, :cond_3

    move-object v3, v1

    goto :goto_2

    :cond_3
    move-object v3, v0

    :goto_2
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 270
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->doubleLay:I

    invoke-virtual {p0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    if-eqz p1, :cond_4

    goto :goto_3

    :cond_4
    move-object v0, v1

    :goto_3
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 273
    :goto_4
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->buttonsLay:I

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 274
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->buttonsLay1:I

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 275
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->buttonsLay2:I

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/LinearLayout;

    .line 276
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->removeAllViewsInLayout()V

    .line 277
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViewsInLayout()V

    .line 278
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->removeAllViewsInLayout()V

    .line 281
    invoke-static {}, Lcom/flyersoft/components/DragSort/ReaderBar;->getButtons()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :cond_5
    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/components/DragSort/SortItem;

    .line 282
    iget-boolean v4, v4, Lcom/flyersoft/components/DragSort/SortItem;->checked:Z

    if-eqz v4, :cond_5

    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 284
    :cond_6
    rem-int/lit8 v1, v3, 0x2

    const/4 v4, 0x1

    if-ne v1, v4, :cond_7

    goto :goto_6

    :cond_7
    const/4 v4, 0x0

    :goto_6
    if-eqz v4, :cond_8

    add-int/lit8 v3, v3, 0x1

    .line 288
    :cond_8
    invoke-static {}, Lcom/flyersoft/components/DragSort/ReaderBar;->getButtons()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_9
    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/components/DragSort/SortItem;

    .line 289
    iget-boolean v6, v5, Lcom/flyersoft/components/DragSort/SortItem;->checked:Z

    if-eqz v6, :cond_9

    .line 290
    invoke-static {p1, v5}, Lcom/flyersoft/components/DragSort/ReaderBar;->addReaderBarButton(Landroid/widget/LinearLayout;Lcom/flyersoft/components/DragSort/SortItem;)V

    .line 291
    div-int/lit8 v6, v3, 0x2

    if-ge v2, v6, :cond_a

    .line 292
    invoke-static {v0, v5}, Lcom/flyersoft/components/DragSort/ReaderBar;->addReaderBarButton(Landroid/widget/LinearLayout;Lcom/flyersoft/components/DragSort/SortItem;)V

    goto :goto_8

    .line 294
    :cond_a
    invoke-static {p0, v5}, Lcom/flyersoft/components/DragSort/ReaderBar;->addReaderBarButton(Landroid/widget/LinearLayout;Lcom/flyersoft/components/DragSort/SortItem;)V

    :goto_8
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_b
    if-nez v4, :cond_c

    .line 298
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-nez v1, :cond_d

    :cond_c
    const/4 v1, 0x0

    .line 299
    invoke-static {p0, v1}, Lcom/flyersoft/components/DragSort/ReaderBar;->addReaderBarButton(Landroid/widget/LinearLayout;Lcom/flyersoft/components/DragSort/SortItem;)V

    .line 301
    :cond_d
    invoke-static {}, Lcom/flyersoft/tools/C;->getTxtBottomBarColor()I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 302
    invoke-static {}, Lcom/flyersoft/tools/C;->getTxtBottomBarColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 303
    invoke-static {}, Lcom/flyersoft/tools/C;->getTxtBottomBarColor()I

    move-result v1

    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 304
    sget-boolean v1, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz v1, :cond_e

    .line 305
    invoke-static {p1}, Lcom/flyersoft/tools/C;->setLayIconTertiary(Landroid/view/View;)V

    .line 306
    invoke-static {v0}, Lcom/flyersoft/tools/C;->setLayIconTertiary(Landroid/view/View;)V

    .line 307
    invoke-static {p0}, Lcom/flyersoft/tools/C;->setLayIconTertiary(Landroid/view/View;)V

    return-void

    .line 309
    :cond_e
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v1

    if-eqz v1, :cond_f

    const v1, -0x404041

    goto :goto_9

    :cond_f
    const v1, -0x949495

    .line 310
    :goto_9
    invoke-static {p1, v1}, Lcom/flyersoft/tools/C;->setLayIconColor(Landroid/view/View;I)V

    .line 311
    invoke-static {v0, v1}, Lcom/flyersoft/tools/C;->setLayIconColor(Landroid/view/View;I)V

    .line 312
    invoke-static {p0, v1}, Lcom/flyersoft/tools/C;->setLayIconColor(Landroid/view/View;I)V

    return-void
.end method

.method public static saveButtons(Ljava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/DragSort/SortItem;",
            ">;)V"
        }
    .end annotation

    .line 86
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 87
    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 88
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/components/DragSort/SortItem;

    iget v3, v3, Lcom/flyersoft/components/DragSort/SortItem;->index:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "*"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/components/DragSort/SortItem;

    iget-boolean v3, v3, Lcom/flyersoft/components/DragSort/SortItem;->checked:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 90
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/reader_bar_icons"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->stringList2Text(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/flyersoft/tools/T;->saveFileText(Ljava/lang/String;Ljava/lang/String;)Z

    return-void
.end method

.method public static setCloudButtons(Z)V
    .locals 4

    .line 172
    invoke-static {}, Lcom/flyersoft/components/DragSort/ReaderBar;->getButtons()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/components/DragSort/SortItem;

    .line 173
    iget v2, v1, Lcom/flyersoft/components/DragSort/SortItem;->index:I

    const/16 v3, 0x12

    if-eq v2, v3, :cond_1

    iget v2, v1, Lcom/flyersoft/components/DragSort/SortItem;->index:I

    const/16 v3, 0x13

    if-ne v2, v3, :cond_0

    .line 174
    :cond_1
    iput-boolean p0, v1, Lcom/flyersoft/components/DragSort/SortItem;->checked:Z

    goto :goto_0

    .line 175
    :cond_2
    invoke-static {}, Lcom/flyersoft/components/DragSort/ReaderBar;->getButtons()Ljava/util/ArrayList;

    move-result-object p0

    invoke-static {p0}, Lcom/flyersoft/components/DragSort/ReaderBar;->saveButtons(Ljava/util/ArrayList;)V

    .line 176
    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p0

    if-nez p0, :cond_3

    .line 177
    sget-object p0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setBottomIconsVisibility()V

    :cond_3
    return-void
.end method
