.class public Lcom/flyersoft/components/DragSort/SelectBar;
.super Ljava/lang/Object;
.source "SelectBar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;
    }
.end annotation


# static fields
.field public static final COUNT:I = 0xc

.field public static sortButtons:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/DragSort/SortItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bText(I)Ljava/lang/String;
    .locals 2

    packed-switch p0, :pswitch_data_0

    .line 62
    const-string p0, ""

    return-object p0

    .line 60
    :pswitch_0
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->names_replacement:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 59
    :pswitch_1
    invoke-static {}, Lcom/flyersoft/tools/A;->getLangContext()Landroid/content/Context;

    move-result-object p0

    sget v0, Lcom/flyersoft/moonreaderp/R$array;->dictionary_list:I

    const/4 v1, 0x4

    invoke-static {p0, v0, v1}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 58
    :pswitch_2
    sget-boolean p0, Lcom/flyersoft/tools/A;->isChinesePRC:Z

    if-eqz p0, :cond_0

    const-string p0, "\u7f51\u7edc\u641c\u7d22"

    return-object p0

    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getLangContext()Landroid/content/Context;

    move-result-object p0

    sget v0, Lcom/flyersoft/moonreaderp/R$array;->dictionary_list:I

    const/4 v1, 0x3

    invoke-static {p0, v0, v1}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 57
    :pswitch_3
    invoke-static {}, Lcom/flyersoft/tools/A;->getLangContext()Landroid/content/Context;

    move-result-object p0

    sget v0, Lcom/flyersoft/moonreaderp/R$array;->dictionary_list:I

    const/4 v1, 0x2

    invoke-static {p0, v0, v1}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 56
    :pswitch_4
    invoke-static {}, Lcom/flyersoft/tools/A;->getLangContext()Landroid/content/Context;

    move-result-object p0

    sget v0, Lcom/flyersoft/moonreaderp/R$array;->dictionary_list:I

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 55
    :pswitch_5
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->search:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 54
    :pswitch_6
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->share:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 53
    :pswitch_7
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->speak:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/flyersoft/components/DragSort/SelectBar;->deleteQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 52
    :pswitch_8
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->dictionary:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 51
    :pswitch_9
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->annotation:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 50
    :pswitch_a
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->highlight:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 49
    :pswitch_b
    sget p0, Lcom/flyersoft/moonreaderp/R$string;->copy:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
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

.method public static bText(Lcom/flyersoft/components/DragSort/SortItem;)Ljava/lang/String;
    .locals 3

    .line 38
    iget-object v0, p0, Lcom/flyersoft/components/DragSort/SortItem;->tag:Ljava/lang/Object;

    instance-of v0, v0, Lcom/flyersoft/components/DictPackage$DictItem;

    if-eqz v0, :cond_0

    .line 39
    iget-object p0, p0, Lcom/flyersoft/components/DragSort/SortItem;->tag:Ljava/lang/Object;

    check-cast p0, Lcom/flyersoft/components/DictPackage$DictItem;

    iget-object p0, p0, Lcom/flyersoft/components/DictPackage$DictItem;->label:Ljava/lang/String;

    goto :goto_0

    .line 41
    :cond_0
    iget p0, p0, Lcom/flyersoft/components/DragSort/SortItem;->index:I

    invoke-static {p0}, Lcom/flyersoft/components/DragSort/SelectBar;->bText(I)Ljava/lang/String;

    move-result-object p0

    .line 42
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xe

    if-le v0, v1, :cond_1

    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    const/16 v2, 0xc

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ".."

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_1
    return-object p0
.end method

.method public static customizeSelectBar(Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityTxt;ZZ)Landroid/view/View;
    .locals 17

    move-object/from16 v6, p0

    const/4 v13, 0x0

    if-nez v6, :cond_0

    return-object v13

    .line 170
    :cond_0
    invoke-static {v6}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->dictionary_select_sort:I

    invoke-virtual {v0, v1, v13}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    move-object v14, v0

    check-cast v14, Landroid/view/ViewGroup;

    .line 171
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->recycler_view:I

    invoke-virtual {v14, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/DragSort/DragSortListLayout;

    .line 172
    invoke-static {}, Lcom/flyersoft/components/DragSort/SelectBar;->getButtons()Ljava/util/ArrayList;

    move-result-object v9

    .line 173
    invoke-virtual {v9}, Ljava/util/ArrayList;->hashCode()I

    move-result v11

    .line 174
    new-instance v1, Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;

    invoke-direct {v1, v6, v9}, Lcom/flyersoft/components/DragSort/SelectBar$MainListAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/DragSort/DragSortListLayout;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 176
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->sourceLangSp:I

    invoke-virtual {v14, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Landroid/widget/Spinner;

    .line 177
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->destLangSp:I

    invoke-virtual {v14, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v12, v0

    check-cast v12, Landroid/widget/Spinner;

    .line 178
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->cnDictSp:I

    invoke-virtual {v14, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Landroid/widget/Spinner;

    .line 179
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->cnDictSp2:I

    invoke-virtual {v14, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Landroid/widget/Spinner;

    .line 180
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->openDict:I

    invoke-virtual {v14, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v15, v0

    check-cast v15, Landroid/widget/CheckBox;

    .line 181
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->oneChar:I

    invoke-virtual {v14, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 183
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->tv1:I

    invoke-virtual {v14, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->dictionary:I

    invoke-static {v4}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "1 <small>("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->single_tap_dict:I

    .line 184
    invoke-static {v4}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ")</small>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 183
    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 185
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->tv2:I

    invoke-virtual {v14, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->dictionary:I

    invoke-static {v5}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "2 <small>("

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->long_tap_dict:I

    .line 186
    invoke-static {v5}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 185
    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->tv3:I

    invoke-virtual {v14, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->google_translate:I

    invoke-static {v3}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v1, 0x0

    if-nez p3, :cond_1

    .line 190
    invoke-virtual {v14, v1, v1}, Landroid/view/ViewGroup;->measure(II)V

    return-object v14

    .line 194
    :cond_1
    sget-boolean v3, Lcom/flyersoft/tools/A;->oneCharDict:Z

    invoke-virtual {v0, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 195
    sget-boolean v3, Lcom/flyersoft/tools/A;->isAsiaLanguage:Z

    if-eqz v3, :cond_2

    const/4 v3, 0x0

    goto :goto_0

    :cond_2
    const/16 v3, 0x8

    :goto_0
    invoke-virtual {v0, v3}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 196
    sget-object v3, Lcom/flyersoft/tools/A;->sourceLanguage:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/A;->getTranslationIndex(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v10, v3}, Landroid/widget/Spinner;->setSelection(I)V

    .line 197
    sget-object v3, Lcom/flyersoft/tools/A;->destLanguage:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/A;->getTranslationIndex(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v12, v3}, Landroid/widget/Spinner;->setSelection(I)V

    .line 198
    sget-boolean v3, Lcom/flyersoft/tools/A;->openDictDirect:Z

    invoke-virtual {v15, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 200
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$array;->dict_list:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    .line 201
    array-length v4, v3

    add-int/lit8 v5, v4, 0x2

    new-array v5, v5, [Ljava/lang/CharSequence;

    const/4 v7, 0x0

    .line 202
    :goto_1
    array-length v13, v3

    if-ge v7, v13, :cond_3

    .line 203
    aget-object v13, v3, v7

    aput-object v13, v5, v7

    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_3
    add-int/lit8 v3, v4, 0x1

    .line 204
    invoke-static {v6, v1, v1}, Lcom/flyersoft/components/DictPackage;->getInstalledDictName(Landroid/content/Context;ZZ)Ljava/lang/CharSequence;

    move-result-object v7

    aput-object v7, v5, v3

    .line 205
    sget v7, Lcom/flyersoft/moonreaderp/R$string;->google_translate:I

    invoke-static {v7}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v4

    .line 206
    new-instance v7, Landroid/widget/ArrayAdapter;

    const v13, 0x1090008

    invoke-direct {v7, v6, v13, v5}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    const v13, 0x1090009

    .line 207
    invoke-virtual {v7, v13}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 208
    invoke-virtual {v2, v7}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 209
    invoke-virtual {v8, v7}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 211
    sget v7, Lcom/flyersoft/tools/A;->dict_index:I

    const/4 v13, -0x2

    const/4 v1, -0x1

    if-ne v7, v1, :cond_4

    move v7, v4

    goto :goto_2

    :cond_4
    sget v7, Lcom/flyersoft/tools/A;->dict_index:I

    if-ne v7, v13, :cond_5

    move v7, v3

    goto :goto_2

    .line 212
    :cond_5
    sget v7, Lcom/flyersoft/tools/A;->dict_index:I

    if-lt v7, v3, :cond_6

    const/4 v7, 0x0

    goto :goto_2

    :cond_6
    sget v7, Lcom/flyersoft/tools/A;->dict_index:I

    .line 213
    :goto_2
    sget v13, Lcom/flyersoft/tools/A;->dict_index2:I

    if-ne v13, v1, :cond_7

    goto :goto_3

    :cond_7
    sget v1, Lcom/flyersoft/tools/A;->dict_index2:I

    const/4 v4, -0x2

    if-ne v1, v4, :cond_8

    move v4, v3

    goto :goto_3

    .line 214
    :cond_8
    sget v1, Lcom/flyersoft/tools/A;->dict_index2:I

    if-lt v1, v3, :cond_9

    const/4 v4, 0x0

    goto :goto_3

    :cond_9
    sget v4, Lcom/flyersoft/tools/A;->dict_index2:I

    .line 215
    :goto_3
    invoke-virtual {v2, v7}, Landroid/widget/Spinner;->setSelection(I)V

    .line 216
    invoke-virtual {v8, v4}, Landroid/widget/Spinner;->setSelection(I)V

    const/4 v1, 0x1

    .line 217
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v8, v1}, Landroid/widget/Spinner;->setTag(Ljava/lang/Object;)V

    .line 219
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    move-object v1, v0

    .line 221
    new-instance v0, Lcom/flyersoft/components/DragSort/SelectBar$1;

    move-object v7, v1

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    move-object v13, v7

    move-object/from16 v16, v9

    const/4 v9, 0x0

    move-object/from16 v7, p1

    invoke-direct/range {v0 .. v8}, Lcom/flyersoft/components/DragSort/SelectBar$1;-><init>(Landroid/os/Looper;Landroid/widget/Spinner;J[Ljava/lang/CharSequence;Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/widget/Spinner;)V

    .line 266
    invoke-virtual {v0, v9}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    if-eqz p2, :cond_a

    const/16 v1, 0x64

    const-wide/16 v3, 0x1f4

    .line 268
    invoke-virtual {v0, v1, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 270
    :cond_a
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v0, v6}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 271
    sget v1, Lcom/flyersoft/moonreaderp/R$string;->customize_dictionary:I

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    invoke-virtual {v1, v14}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    move-object v3, v0

    new-instance v0, Lcom/flyersoft/components/DragSort/SelectBar$2;

    move-object v4, v2

    move-object v9, v6

    move-object v6, v8

    move-object v2, v10

    move-object v8, v13

    move-object v7, v15

    move-object/from16 v10, p1

    move-object v15, v1

    move-object v13, v3

    move-object v3, v12

    move-object/from16 v1, v16

    move/from16 v12, p2

    invoke-direct/range {v0 .. v12}, Lcom/flyersoft/components/DragSort/SelectBar$2;-><init>(Ljava/util/ArrayList;Landroid/widget/Spinner;Landroid/widget/Spinner;Landroid/widget/Spinner;[Ljava/lang/CharSequence;Landroid/widget/Spinner;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityTxt;IZ)V

    const v1, 0x104000a

    .line 272
    invoke-virtual {v15, v1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const/high16 v1, 0x1040000

    const/4 v2, 0x0

    .line 303
    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    .line 305
    invoke-virtual {v13}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-object v14
.end method

.method private static deleteQuote(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 66
    const-string v0, "("

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    const/4 v1, 0x0

    .line 68
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    :cond_0
    return-object p0
.end method

.method private static exists(Ljava/util/ArrayList;Lcom/flyersoft/components/DictPackage$DictItem;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/DragSort/SortItem;",
            ">;",
            "Lcom/flyersoft/components/DictPackage$DictItem;",
            ")Z"
        }
    .end annotation

    .line 159
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/DragSort/SortItem;

    .line 160
    iget-object v0, v0, Lcom/flyersoft/components/DragSort/SortItem;->tag:Ljava/lang/Object;

    if-ne p1, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static getButtons()Ljava/util/ArrayList;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/DragSort/SortItem;",
            ">;"
        }
    .end annotation

    .line 86
    sget-object v0, Lcom/flyersoft/components/DragSort/SelectBar;->sortButtons:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    return-object v0

    .line 89
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/flyersoft/components/DragSort/SelectBar;->sortButtons:Ljava/util/ArrayList;

    .line 90
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/select_bar"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFileText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 91
    invoke-static {v0}, Lcom/flyersoft/tools/T;->text2StringList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    const/4 v3, 0x4

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 95
    :try_start_0
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_2

    const-string v6, "11*"

    invoke-virtual {v0, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x0

    .line 96
    :goto_0
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v0, v6, :cond_2

    .line 97
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    const-string v7, "10*"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    add-int/2addr v0, v4

    .line 98
    const-string v6, "11*false"

    invoke-virtual {v2, v0, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 99
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2}, Lcom/flyersoft/tools/T;->stringList2Text(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->saveFileText(Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 105
    :cond_2
    :goto_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0xc

    if-lt v0, v1, :cond_a

    const/4 v0, 0x0

    .line 106
    :goto_2
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v0, v6, :cond_5

    .line 107
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 108
    const-string v7, "#"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v8, "*true"

    if-eqz v7, :cond_3

    .line 109
    :try_start_1
    const-string v7, "*"

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v6, v4, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 110
    invoke-static {v7}, Lcom/flyersoft/components/DictPackage;->getProcessTextIndex(Ljava/lang/String;)I

    move-result v7

    const/4 v9, -0x1

    if-eq v7, v9, :cond_4

    .line 112
    sget-object v9, Lcom/flyersoft/components/DictPackage;->processTextList:Ljava/util/ArrayList;

    invoke-virtual {v9, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    move-object v14, v7

    check-cast v14, Lcom/flyersoft/components/DictPackage$DictItem;

    .line 113
    sget-object v7, Lcom/flyersoft/components/DragSort/SelectBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v9, Lcom/flyersoft/components/DragSort/SortItem;

    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    iget-object v13, v14, Lcom/flyersoft/components/DictPackage$DictItem;->label:Ljava/lang/String;

    const/4 v10, -0x1

    const/4 v12, 0x0

    invoke-direct/range {v9 .. v14}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 116
    :cond_3
    invoke-static {v6}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v7

    .line 117
    sget-object v12, Lcom/flyersoft/components/DragSort/SelectBar;->sortButtons:Ljava/util/ArrayList;

    move-object v9, v6

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    invoke-virtual {v9, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    invoke-static {v7}, Lcom/flyersoft/components/DragSort/SelectBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v9, 0x0

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v12, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_4
    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 120
    :cond_5
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 121
    sget-object v2, Lcom/flyersoft/components/DragSort/SelectBar;->sortButtons:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_6
    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/components/DragSort/SortItem;

    .line 122
    iget v7, v6, Lcom/flyersoft/components/DragSort/SortItem;->index:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_6

    .line 123
    iget v6, v6, Lcom/flyersoft/components/DragSort/SortItem;->index:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 124
    :cond_7
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    if-lt v0, v1, :cond_a

    :goto_5
    if-ge v5, v3, :cond_8

    .line 149
    sget-object v0, Lcom/flyersoft/components/DragSort/SelectBar;->sortButtons:Ljava/util/ArrayList;

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/components/DragSort/SortItem;

    iput-boolean v4, v0, Lcom/flyersoft/components/DragSort/SortItem;->checked:Z

    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    .line 151
    :cond_8
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/components/DictPackage;->getProcessTextList(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_9
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lcom/flyersoft/components/DictPackage$DictItem;

    .line 152
    sget-object v1, Lcom/flyersoft/components/DragSort/SelectBar;->sortButtons:Ljava/util/ArrayList;

    invoke-static {v1, v7}, Lcom/flyersoft/components/DragSort/SelectBar;->exists(Ljava/util/ArrayList;Lcom/flyersoft/components/DictPackage$DictItem;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 153
    sget-object v1, Lcom/flyersoft/components/DragSort/SelectBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v2, Lcom/flyersoft/components/DragSort/SortItem;

    const/4 v5, 0x0

    iget-object v6, v7, Lcom/flyersoft/components/DictPackage$DictItem;->label:Ljava/lang/String;

    const/4 v3, -0x1

    const/4 v4, 0x1

    invoke-direct/range {v2 .. v7}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6

    :catch_0
    move-exception v0

    .line 127
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 131
    :cond_a
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/flyersoft/components/DragSort/SelectBar;->sortButtons:Ljava/util/ArrayList;

    .line 132
    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    invoke-static {v5}, Lcom/flyersoft/components/DragSort/SelectBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v9, 0x0

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 133
    sget-object v0, Lcom/flyersoft/components/DragSort/SelectBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    invoke-static {v4}, Lcom/flyersoft/components/DragSort/SelectBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v7, 0x1

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 134
    sget-object v0, Lcom/flyersoft/components/DragSort/SelectBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/4 v1, 0x2

    invoke-static {v1}, Lcom/flyersoft/components/DragSort/SelectBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v7, 0x2

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 135
    sget-object v0, Lcom/flyersoft/components/DragSort/SelectBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/4 v1, 0x3

    invoke-static {v1}, Lcom/flyersoft/components/DragSort/SelectBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v7, 0x3

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 136
    sget-object v0, Lcom/flyersoft/components/DragSort/SelectBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v8

    invoke-static {v3}, Lcom/flyersoft/components/DragSort/SelectBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v7, 0x4

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 137
    sget-object v0, Lcom/flyersoft/components/DragSort/SelectBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/4 v1, 0x5

    invoke-static {v1}, Lcom/flyersoft/components/DragSort/SelectBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v7, 0x5

    const/4 v8, 0x1

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 138
    sget-object v0, Lcom/flyersoft/components/DragSort/SelectBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/4 v1, 0x6

    invoke-static {v1}, Lcom/flyersoft/components/DragSort/SelectBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v7, 0x6

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 139
    sget-object v0, Lcom/flyersoft/components/DragSort/SelectBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/4 v1, 0x7

    invoke-static {v1}, Lcom/flyersoft/components/DragSort/SelectBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v7, 0x7

    const/4 v8, 0x0

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 140
    sget-object v0, Lcom/flyersoft/components/DragSort/SelectBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/16 v1, 0x8

    invoke-static {v1}, Lcom/flyersoft/components/DragSort/SelectBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v7, 0x8

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 141
    sget-object v0, Lcom/flyersoft/components/DragSort/SelectBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/16 v1, 0x9

    invoke-static {v1}, Lcom/flyersoft/components/DragSort/SelectBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v7, 0x9

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 142
    sget-object v0, Lcom/flyersoft/components/DragSort/SelectBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/16 v1, 0xa

    invoke-static {v1}, Lcom/flyersoft/components/DragSort/SelectBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v7, 0xa

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 143
    sget-object v0, Lcom/flyersoft/components/DragSort/SelectBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v6, Lcom/flyersoft/components/DragSort/SortItem;

    const/16 v1, 0xb

    invoke-static {v1}, Lcom/flyersoft/components/DragSort/SelectBar;->bText(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v7, 0xb

    invoke-direct/range {v6 .. v11}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 144
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/components/DictPackage;->getProcessTextList(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lcom/flyersoft/components/DictPackage$DictItem;

    .line 145
    sget-object v1, Lcom/flyersoft/components/DragSort/SelectBar;->sortButtons:Ljava/util/ArrayList;

    new-instance v2, Lcom/flyersoft/components/DragSort/SortItem;

    const/4 v5, 0x0

    iget-object v6, v7, Lcom/flyersoft/components/DictPackage$DictItem;->label:Ljava/lang/String;

    const/4 v3, -0x1

    const/4 v4, 0x1

    invoke-direct/range {v2 .. v7}, Lcom/flyersoft/components/DragSort/SortItem;-><init>(IZILjava/lang/CharSequence;Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7

    .line 146
    :cond_b
    sget-object v0, Lcom/flyersoft/components/DragSort/SelectBar;->sortButtons:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/components/DragSort/SelectBar;->saveButtons(Ljava/util/ArrayList;)V

    .line 155
    :cond_c
    sget-object v0, Lcom/flyersoft/components/DragSort/SelectBar;->sortButtons:Ljava/util/ArrayList;

    return-object v0
.end method

.method public static saveButtons(Ljava/util/ArrayList;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/components/DragSort/SortItem;",
            ">;)V"
        }
    .end annotation

    .line 73
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 74
    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 75
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/components/DragSort/SortItem;

    .line 76
    iget-object v3, v2, Lcom/flyersoft/components/DragSort/SortItem;->tag:Ljava/lang/Object;

    instance-of v3, v3, Lcom/flyersoft/components/DictPackage$DictItem;

    const-string v4, "*"

    if-eqz v3, :cond_0

    .line 77
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "#"

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, v2, Lcom/flyersoft/components/DragSort/SortItem;->tag:Ljava/lang/Object;

    check-cast v5, Lcom/flyersoft/components/DictPackage$DictItem;

    iget-object v5, v5, Lcom/flyersoft/components/DictPackage$DictItem;->clsName:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, v2, Lcom/flyersoft/components/DragSort/SortItem;->checked:Z

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 79
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget v5, v2, Lcom/flyersoft/components/DragSort/SortItem;->index:I

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, v2, Lcom/flyersoft/components/DragSort/SortItem;->checked:Z

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 81
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/select_bar"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->stringList2Text(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/flyersoft/tools/T;->saveFileText(Ljava/lang/String;Ljava/lang/String;)Z

    return-void
.end method
