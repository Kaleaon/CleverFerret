.class public Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;
.super Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;
.source "PrefChapters.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ChapterAdapter"
.end annotation


# instance fields
.field private expandedClick:Landroid/view/View$OnClickListener;

.field onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

.field onItemClick:Landroid/view/View$OnClickListener;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefChapters;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 621
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;-><init>()V

    .line 639
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter$1;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    .line 679
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter$2;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->expandedClick:Landroid/view/View$OnClickListener;

    .line 771
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter$3;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter$3;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->onItemClick:Landroid/view/View$OnClickListener;

    .line 622
    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$fgethasSubChapter(Lcom/flyersoft/moonreaderp/PrefChapters;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 623
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->createToc()V

    return-void

    .line 625
    :cond_0
    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$fgetoToc(Lcom/flyersoft/moonreaderp/PrefChapters;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$fputnToc(Lcom/flyersoft/moonreaderp/PrefChapters;Ljava/util/ArrayList;)V

    return-void
.end method


# virtual methods
.method public createToc()V
    .locals 8

    .line 652
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$fputnToc(Lcom/flyersoft/moonreaderp/PrefChapters;Ljava/util/ArrayList;)V

    .line 654
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->tocSearchKey:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    move-object v0, v1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->tocSearchKey:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    :goto_0
    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 656
    :cond_1
    :goto_1
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v4}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$fgetoToc(Lcom/flyersoft/moonreaderp/PrefChapters;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v3, v4, :cond_2

    .line 672
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->curChapterId:Ljava/lang/Integer;

    return-void

    .line 658
    :cond_2
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v4}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$fgetoToc(Lcom/flyersoft/moonreaderp/PrefChapters;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;

    .line 659
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v5}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$fgetoToc(Lcom/flyersoft/moonreaderp/PrefChapters;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/16 v6, 0x14

    if-le v5, v6, :cond_3

    .line 660
    iget-object v5, v4, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->name:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    const/16 v6, 0x96

    if-le v5, v6, :cond_3

    .line 661
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, v4, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->name:Ljava/lang/String;

    const/16 v7, 0x93

    invoke-virtual {v6, v2, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "..."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->name:Ljava/lang/String;

    .line 662
    :cond_3
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_4

    iget-object v5, v4, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->lowerCaseName:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 663
    :cond_4
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v5}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$fgetnToc(Lcom/flyersoft/moonreaderp/PrefChapters;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 665
    :cond_5
    iget-boolean v5, v4, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->expanded:Z

    if-nez v5, :cond_7

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_6

    goto :goto_2

    :cond_6
    add-int/lit8 v3, v3, 0x1

    .line 668
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v5}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$fgetoToc(Lcom/flyersoft/moonreaderp/PrefChapters;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v3, v5, :cond_1

    .line 669
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v5}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$fgetoToc(Lcom/flyersoft/moonreaderp/PrefChapters;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;

    iget v5, v5, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->indent:I

    iget v6, v4, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->indent:I

    if-gt v5, v6, :cond_6

    goto/16 :goto_1

    :cond_7
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_1
.end method

.method public getCount()I
    .locals 1

    .line 676
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$fgetnToc(Lcom/flyersoft/moonreaderp/PrefChapters;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItemCount()I
    .locals 1

    .line 648
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getView(ILandroid/view/View;)V
    .locals 12

    .line 698
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->line:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    if-nez p1, :cond_0

    const/4 v2, 0x4

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 700
    sget-boolean v0, Lcom/flyersoft/tools/A;->chapterReversed:Z

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 701
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->getCount()I

    move-result v0

    sub-int/2addr v0, p1

    add-int/lit8 p1, v0, -0x1

    .line 703
    :cond_1
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->chapter_list_tv:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 704
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->chapter_list_pageno:I

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 705
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->imageView1:I

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    .line 706
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/flyersoft/tools/A;->getSelectedRes(Landroid/content/Context;)I

    move-result v5

    invoke-virtual {p2, v5}, Landroid/view/View;->setBackgroundResource(I)V

    .line 707
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v5}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$fgetnToc(Lcom/flyersoft/moonreaderp/PrefChapters;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;

    .line 711
    iget v6, v5, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->indent:I

    const v7, -0x111112

    const/16 v8, 0x14

    const/16 v9, 0x8

    const/16 v10, 0xa

    if-lez v6, :cond_4

    iget-boolean v6, v5, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->hasSubChapter:Z

    if-eqz v6, :cond_4

    .line 712
    invoke-virtual {v4}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    .line 713
    iget v11, v5, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->indent:I

    sub-int/2addr v11, v2

    mul-int/lit8 v11, v11, 0xf

    add-int/lit8 v11, v11, 0x1c

    int-to-float v11, v11

    invoke-static {v11}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v11

    iput v11, v6, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 714
    iget v6, v5, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->indent:I

    sub-int/2addr v6, v2

    mul-int/lit8 v6, v6, 0xf

    add-int/lit8 v6, v6, 0xd

    int-to-float v6, v6

    invoke-static {v6}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v6

    const/high16 v11, 0x40a00000    # 5.0f

    invoke-static {v11}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v11

    invoke-virtual {v4, v6, v1, v11, v1}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 715
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 716
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->expandedClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v4, v6}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 717
    sget v6, Lcom/flyersoft/material/components/icons/R$drawable;->my_about_selector:I

    invoke-virtual {v4, v6}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 718
    iget-boolean v6, v5, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->expanded:Z

    if-eqz v6, :cond_2

    sget v6, Lcom/flyersoft/moonreaderp/R$drawable;->toc_open:I

    goto :goto_1

    :cond_2
    sget v6, Lcom/flyersoft/moonreaderp/R$drawable;->toc_closed:I

    :goto_1
    invoke-virtual {v4, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 719
    invoke-virtual {v4}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v11

    if-eqz v11, :cond_3

    const v11, -0x111112

    goto :goto_2

    :cond_3
    const v11, -0x99999a

    :goto_2
    invoke-virtual {v6, v11}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 720
    invoke-virtual {v4, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    const/4 v4, 0x0

    .line 721
    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    int-to-float v6, v10

    invoke-static {v6}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v10

    int-to-float v8, v8

    invoke-static {v8}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v8

    invoke-static {v6}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v6

    invoke-virtual {v0, v4, v10, v8, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 722
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    goto :goto_4

    .line 724
    :cond_4
    invoke-virtual {v4, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 725
    iget v4, v5, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->indent:I

    if-lez v4, :cond_5

    iget v4, v5, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->indent:I

    sub-int/2addr v4, v2

    mul-int/lit8 v4, v4, 0xf

    add-int/lit8 v4, v4, 0x1c

    int-to-float v4, v4

    goto :goto_3

    :cond_5
    int-to-float v4, v8

    :goto_3
    invoke-static {v4}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    int-to-float v6, v10

    invoke-static {v6}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v10

    int-to-float v8, v8

    invoke-static {v8}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v8

    invoke-static {v6}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v6

    invoke-virtual {v0, v4, v10, v8, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 726
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 729
    :goto_4
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v4

    if-eqz v4, :cond_6

    goto :goto_5

    :cond_6
    const v7, -0xcccccd

    .line 731
    :goto_5
    iget-object v4, v5, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->name:Ljava/lang/String;

    invoke-static {v4}, Lcom/flyersoft/moonreaderp/PrefChapters;->cleanChapterTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 732
    invoke-static {v4}, Lcom/flyersoft/tools/T;->turnCnChapterNum(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 744
    sget-boolean v6, Lcom/flyersoft/tools/A;->isTablet:Z

    const/high16 v8, 0x41600000    # 14.0f

    if-eqz v6, :cond_7

    goto :goto_6

    :cond_7
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    const/16 v10, 0x64

    if-ge v6, v10, :cond_8

    goto :goto_6

    :cond_8
    const/high16 v8, 0x41400000    # 12.0f

    :goto_6
    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 745
    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 748
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v6, 0x41500000    # 13.0f

    .line 749
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 750
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookType()I

    move-result v6

    const/4 v7, 0x7

    const-string v8, ""

    if-eq v6, v7, :cond_a

    .line 751
    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 752
    sget-boolean v6, Lcom/flyersoft/tools/A;->totalPageNum:Z

    if-eqz v6, :cond_b

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v6}, Lcom/flyersoft/moonreaderp/PrefChapters;->isEbook()Z

    move-result v6

    if-eqz v6, :cond_b

    sget-object v6, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    iget-boolean v6, v6, Lcom/flyersoft/books/BaseEBook;->isCountAboutPagesWorking:Z

    if-nez v6, :cond_b

    .line 753
    sget-object v6, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    iget v7, v5, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->index:I

    invoke-virtual {v6, v7, v1, v2}, Lcom/flyersoft/books/BaseEBook;->getCurPageInTotal(III)I

    move-result v6

    if-gt v6, v2, :cond_9

    .line 754
    iget v2, v5, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->index:I

    if-lez v2, :cond_9

    const/16 v1, 0x8

    :cond_9
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 755
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_7

    .line 759
    :cond_a
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v5, v5, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->pageNumber:I

    add-int/2addr v5, v2

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 762
    :cond_b
    :goto_7
    invoke-static {v4}, Lcom/flyersoft/tools/A;->chineseJianFanConvert(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 763
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-lez p1, :cond_c

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$mgetCurChapterId(Lcom/flyersoft/moonreaderp/PrefChapters;)I

    move-result v1

    if-ne p1, v1, :cond_c

    sget-object v8, Lcom/flyersoft/components/MyMenu;->SELECT_END:Ljava/lang/String;

    :cond_c
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 764
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefChapters;->tocSearchKey:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_d

    goto :goto_8

    :cond_d
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefChapters;->tocSearchKey:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/flyersoft/moonreaderp/PrefChapters;->boldKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    :goto_8
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 767
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 768
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->onItemClick:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    .line 636
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    invoke-super {p0, p2, p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;->fillData(ILandroid/view/View;Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 2

    .line 630
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ChapterAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->chapter_list_item:I

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 631
    new-instance p2, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;

    invoke-direct {p2, p0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;-><init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;Landroid/view/View;)V

    return-object p2
.end method
