.class public Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;
.super Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;
.source "PrefFontPick.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefFontPick;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FontAdapter"
.end annotation


# instance fields
.field lineHeight:I

.field onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

.field onItemClick:Landroid/view/View$OnClickListener;

.field onMenuClick:Landroid/view/View$OnClickListener;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/PrefFontPick;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 784
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;-><init>()V

    .line 797
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter$1;-><init>(Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    const/4 p1, 0x0

    .line 809
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->lineHeight:I

    .line 891
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter$2;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter$2;-><init>(Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->onItemClick:Landroid/view/View$OnClickListener;

    .line 900
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter$3;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter$3;-><init>(Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->onMenuClick:Landroid/view/View$OnClickListener;

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 811
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getFonts()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 815
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public getItemCount()I
    .locals 1

    .line 806
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;)V
    .locals 11

    .line 825
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->overflow1:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 826
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->tv:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 827
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->sub:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 828
    iget v3, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->lineHeight:I

    if-lez v3, :cond_0

    mul-int/lit8 v3, v3, 0x3

    goto :goto_0

    :cond_0
    const/high16 v3, 0x43480000    # 200.0f

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    :goto_0
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setMaxHeight(I)V

    .line 830
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getFonts()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 831
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/flyersoft/tools/A;->outerFontsFolder:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 832
    invoke-static {v4}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_1

    const v4, 0x22888888

    goto :goto_1

    :cond_1
    const/4 v4, 0x0

    :goto_1
    invoke-virtual {p2, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 834
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-static {v4}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$fgetoutOfMemory(Lcom/flyersoft/moonreaderp/PrefFontPick;)Z

    move-result v4

    if-nez v4, :cond_2

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-static {v4}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$fgetfontFaces(Lcom/flyersoft/moonreaderp/PrefFontPick;)[Landroid/graphics/Typeface;

    move-result-object v4

    aget-object v4, v4, p1

    if-nez v4, :cond_2

    .line 836
    :try_start_0
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-static {v4}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$fgetfontFaces(Lcom/flyersoft/moonreaderp/PrefFontPick;)[Landroid/graphics/Typeface;

    move-result-object v4

    invoke-static {v3, v5}, Lcom/flyersoft/tools/A;->getTypeFace(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v6

    aput-object v6, v4, p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 841
    :catch_0
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    const/4 v6, 0x1

    invoke-static {v4, v6}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$fputoutOfMemory(Lcom/flyersoft/moonreaderp/PrefFontPick;Z)V

    goto :goto_2

    :catch_1
    move-exception v4

    .line 839
    invoke-static {v4}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 844
    :cond_2
    :goto_2
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-static {v4}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$fgetoutOfMemory(Lcom/flyersoft/moonreaderp/PrefFontPick;)Z

    move-result v4

    if-nez v4, :cond_7

    .line 845
    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 846
    sget v4, Lcom/flyersoft/tools/A;->fontSize:F

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 847
    sget v4, Lcom/flyersoft/tools/A;->fontColor:I

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 848
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v4

    sget-boolean v6, Lcom/flyersoft/tools/A;->fontAnti:Z

    invoke-virtual {v4, v6}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    .line 849
    sget-boolean v4, Lcom/flyersoft/tools/A;->fontBold:Z

    if-eqz v4, :cond_3

    .line 850
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v4

    sget-boolean v6, Lcom/flyersoft/tools/A;->fontBold:Z

    invoke-virtual {v4, v6}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 851
    :cond_3
    sget-boolean v4, Lcom/flyersoft/tools/A;->fontUnderline:Z

    if-eqz v4, :cond_4

    .line 852
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v4

    sget-boolean v6, Lcom/flyersoft/tools/A;->fontUnderline:Z

    invoke-virtual {v4, v6}, Landroid/text/TextPaint;->setUnderlineText(Z)V

    .line 853
    :cond_4
    sget-boolean v4, Lcom/flyersoft/tools/A;->fontItalic:Z

    if-eqz v4, :cond_6

    .line 854
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v4

    sget-boolean v6, Lcom/flyersoft/tools/A;->fontItalic:Z

    if-eqz v6, :cond_5

    invoke-static {v3}, Lcom/flyersoft/tools/A;->getFontSkew(Ljava/lang/String;)F

    move-result v6

    goto :goto_3

    :cond_5
    const/4 v6, 0x0

    :goto_3
    invoke-virtual {v4, v6}, Landroid/text/TextPaint;->setTextSkewX(F)V

    .line 855
    :cond_6
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-static {v4}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$fgetfontFaces(Lcom/flyersoft/moonreaderp/PrefFontPick;)[Landroid/graphics/Typeface;

    move-result-object v4

    aget-object v4, v4, p1

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 858
    :cond_7
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, " ("

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-virtual {v6}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getContext()Landroid/content/Context;

    move-result-object v6

    sget v7, Lcom/flyersoft/moonreaderp/R$string;->app_name:I

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ")"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 859
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-static {v6, v3}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$misCurrentFont(Lcom/flyersoft/moonreaderp/PrefFontPick;Ljava/lang/String;)Z

    move-result v6

    const-string v7, ""

    if-eqz v6, :cond_8

    sget-object v6, Lcom/flyersoft/components/MyMenu;->SELECT_END:Ljava/lang/String;

    goto :goto_4

    :cond_8
    move-object v6, v7

    :goto_4
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 860
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/PrefFontPick;->key:Ljava/lang/String;

    invoke-static {v6}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_9

    .line 861
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/PrefFontPick;->key:Ljava/lang/String;

    invoke-static {v3, v8}, Lcom/flyersoft/moonreaderp/PrefChapters;->boldKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_5

    .line 863
    :cond_9
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 865
    :goto_5
    invoke-static {v3}, Lcom/flyersoft/tools/A;->getFontWeight(Ljava/lang/String;)I

    move-result v4

    .line 866
    invoke-static {v3}, Lcom/flyersoft/tools/A;->getFontSkew(Ljava/lang/String;)F

    move-result v3

    .line 867
    sget v6, Lcom/flyersoft/tools/A;->DEFAULT_WEIGHT:I

    if-ne v4, v6, :cond_b

    sget v6, Lcom/flyersoft/tools/A;->DEFAULT_SKEW:F

    cmpl-float v6, v3, v6

    if-eqz v6, :cond_a

    goto :goto_6

    :cond_a
    const/16 v3, 0x8

    .line 876
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_8

    .line 869
    :cond_b
    :goto_6
    sget v6, Lcom/flyersoft/tools/A;->DEFAULT_WEIGHT:I

    const-string v8, ": "

    if-eq v4, v6, :cond_c

    .line 870
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-virtual {v9}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getContext()Landroid/content/Context;

    move-result-object v9

    sget v10, Lcom/flyersoft/moonreaderp/R$string;->font_weight:I

    invoke-virtual {v9, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_7

    :cond_c
    move-object v4, v7

    .line 871
    :goto_7
    sget v6, Lcom/flyersoft/tools/A;->DEFAULT_SKEW:F

    cmpl-float v6, v3, v6

    if-eqz v6, :cond_e

    .line 872
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_d

    const-string v7, " "

    :cond_d
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v7, Lcom/flyersoft/moonreaderp/R$string;->italic:I

    invoke-virtual {v4, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 873
    :cond_e
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 874
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 878
    :goto_8
    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->lineHeight:I

    if-nez v2, :cond_f

    .line 879
    invoke-virtual {v1, v5, v5}, Landroid/widget/TextView;->measure(II)V

    .line 880
    invoke-virtual {v1}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v1

    iput v1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->lineHeight:I

    .line 883
    :cond_f
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 884
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->onMenuClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 887
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 888
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->onItemClick:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    .line 794
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    invoke-super {p0, p2, p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;->fillData(ILandroid/view/View;Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 2

    .line 788
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$FontAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefFontPick;->res:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->font_list_item:I

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 789
    new-instance p2, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;

    invoke-direct {p2, p0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;-><init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;Landroid/view/View;)V

    return-object p2
.end method
