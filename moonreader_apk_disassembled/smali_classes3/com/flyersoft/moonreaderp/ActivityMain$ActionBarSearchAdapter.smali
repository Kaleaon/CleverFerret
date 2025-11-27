.class public Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;
.super Landroidx/cursoradapter/widget/CursorAdapter;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ActionBarSearchAdapter"
.end annotation


# instance fields
.field cursor:Landroid/database/Cursor;

.field key:Ljava/lang/String;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/content/Context;Landroid/database/Cursor;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 4729
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 p1, 0x1

    .line 4730
    invoke-direct {p0, p2, p3, p1}, Landroidx/cursoradapter/widget/CursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;Z)V

    .line 4731
    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->cursor:Landroid/database/Cursor;

    .line 4732
    iput-object p4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->key:Ljava/lang/String;

    return-void
.end method

.method private h(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 4736
    sget v0, Lcom/flyersoft/tools/A;->lastTab:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->annotBookLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->annotBookLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    return-object p1

    .line 4738
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->key:Ljava/lang/String;

    invoke-static {v0, p1, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mboldKey(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private h2(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 4742
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->key:Ljava/lang/String;

    invoke-static {v0, p1, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mboldKey(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 12

    const-string p2, " ("

    const-string v0, "<i>"

    const/4 v1, 0x1

    .line 4746
    invoke-interface {p3, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p3

    .line 4747
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->textView1:I

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 4748
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->textView2:I

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 4749
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->imageView1:I

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    .line 4752
    :try_start_0
    const-string v4, "@1@"

    invoke-virtual {p3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v5, ": </b>"

    const/16 v6, 0x8

    const/4 v7, 0x4

    const/4 v8, 0x3

    const-string v9, "<b>"

    if-eqz v4, :cond_0

    .line 4753
    :try_start_1
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 4754
    invoke-virtual {p1, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 4755
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v0, Lcom/flyersoft/moonreaderp/R$array;->shelf_sort_by:I

    invoke-static {p2, v0, v1}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4756
    invoke-virtual {p3, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2}, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 4755
    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 4757
    :cond_0
    const-string v4, "@2@"

    invoke-virtual {p3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const-string v10, ">"

    const-string v11, "<"

    if-eqz v4, :cond_2

    .line 4758
    :try_start_2
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 4759
    invoke-virtual {p1, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 4760
    invoke-virtual {p3, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 4761
    invoke-virtual {p1, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-virtual {p1, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 4762
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    sub-int/2addr p2, v1

    invoke-virtual {p1, v1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 4763
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->series:I

    invoke-virtual {p3, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 4764
    :cond_2
    const-string v4, "@3@"

    invoke-virtual {p3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 4765
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 4766
    invoke-virtual {p1, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 4767
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->shelf_tags:I

    invoke-virtual {p2, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4768
    invoke-virtual {p3, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2}, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 4767
    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 4769
    :cond_3
    const-string v4, "#0#"

    invoke-virtual {p3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 4770
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 4771
    invoke-virtual {p1, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 4772
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "</i>"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 4773
    :cond_4
    const-string v0, "#1#"

    invoke-virtual {p3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    const-string v4, "#3#"

    const-string v5, "#2#"

    const/4 v9, 0x0

    if-eqz v0, :cond_6

    .line 4774
    :try_start_3
    invoke-virtual {p1, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 4775
    invoke-virtual {p3, v5, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p1

    .line 4776
    invoke-virtual {p3, v4, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    .line 4777
    sget v1, Lcom/flyersoft/tools/A;->lastTab:I

    if-ne v1, v7, :cond_5

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->annotBookLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getVisibility()I

    move-result v1

    if-nez v1, :cond_5

    add-int/lit8 v1, v0, 0x3

    .line 4778
    invoke-virtual {p3, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 4779
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    add-int/2addr p1, v8

    invoke-virtual {p3, p1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->key:Ljava/lang/String;

    .line 4780
    invoke-static {p2, v1, p3}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mgetAnnotCount(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;Ljava/lang/String;)I

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ")"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->greyColorHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 4779
    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4781
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_0

    :cond_5
    add-int/2addr p1, v8

    .line 4783
    invoke-virtual {p3, p1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    add-int/2addr v0, v8

    .line 4784
    invoke-virtual {p3, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4785
    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_0

    .line 4787
    :cond_6
    const-string p2, "#4#"

    invoke-virtual {p3, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_8

    .line 4788
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 4789
    invoke-virtual {p1, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 4790
    const-string p1, "#5#"

    invoke-virtual {p3, p1, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p1

    .line 4791
    invoke-virtual {p3, v8, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 4792
    invoke-virtual {p1, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p2

    const/4 p3, -0x1

    if-eq p2, p3, :cond_7

    .line 4794
    invoke-virtual {p1, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-eq v0, p3, :cond_7

    add-int/2addr p2, v1

    .line 4796
    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 4798
    :cond_7
    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 4799
    :cond_8
    const-string p2, "#6#"

    invoke-virtual {p3, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_9

    .line 4800
    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 4801
    invoke-virtual {p1, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 4802
    invoke-virtual {p3, v5, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p1

    .line 4803
    invoke-virtual {p3, v4, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p2

    add-int/2addr p1, v8

    .line 4804
    invoke-virtual {p3, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->h2(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    add-int/2addr p2, v8

    .line 4805
    invoke-virtual {p3, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->h2(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 4807
    :cond_9
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 4808
    invoke-virtual {p1, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 4809
    invoke-direct {p0, p3}, Lcom/flyersoft/moonreaderp/ActivityMain$ActionBarSearchAdapter;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4811
    :goto_0
    sget-boolean p1, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz p1, :cond_b

    const p1, -0x111112

    .line 4812
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 4813
    sget-boolean p1, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz p1, :cond_a

    const p1, -0x777778

    goto :goto_1

    :cond_a
    const p1, -0x666667

    :goto_1
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setTextColor(I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 4816
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_b
    return-void
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 4821
    const-string p2, "layout_inflater"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/LayoutInflater;

    .line 4822
    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->action_search_item:I

    const/4 v0, 0x0

    invoke-virtual {p1, p2, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method
