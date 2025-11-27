.class Lcom/flyersoft/components/MyMenu$MyMenuAdapter;
.super Landroid/widget/BaseAdapter;
.source "MyMenu.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/MyMenu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyMenuAdapter"
.end annotation


# instance fields
.field items:[Ljava/lang/CharSequence;

.field final synthetic this$0:Lcom/flyersoft/components/MyMenu;

.field topBar:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/flyersoft/components/MyMenu;[Ljava/lang/CharSequence;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .line 412
    iput-object p1, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->this$0:Lcom/flyersoft/components/MyMenu;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 413
    iput-object p2, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->items:[Ljava/lang/CharSequence;

    .line 414
    iput-object p3, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->topBar:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 2

    .line 417
    iget-object v0, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->items:[Ljava/lang/CharSequence;

    array-length v0, v0

    iget-object v1, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->topBar:Landroid/view/View;

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    add-int/2addr v0, v1

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 420
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 426
    iget-object p3, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->this$0:Lcom/flyersoft/components/MyMenu;

    iget-object p3, p3, Lcom/flyersoft/components/MyMenu;->mContext:Landroid/content/Context;

    if-nez p3, :cond_0

    return-object p2

    .line 428
    :cond_0
    iget-object p3, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->topBar:Landroid/view/View;

    if-eqz p3, :cond_3

    if-nez p1, :cond_2

    .line 430
    invoke-virtual {p3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 431
    iget-object p1, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->topBar:Landroid/view/View;

    new-instance p2, Landroid/view/ViewGroup$LayoutParams;

    iget-object p3, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->topBar:Landroid/view/View;

    invoke-virtual {p3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    const/4 v0, -0x2

    invoke-direct {p2, v0, p3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 432
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->topBar:Landroid/view/View;

    return-object p1

    :cond_2
    add-int/lit8 p1, p1, -0x1

    :cond_3
    if-eqz p2, :cond_5

    .line 437
    instance-of p3, p2, Landroid/widget/TextView;

    if-nez p3, :cond_4

    goto :goto_0

    :cond_4
    check-cast p2, Landroid/widget/TextView;

    goto :goto_1

    :cond_5
    :goto_0
    new-instance p2, Landroid/widget/TextView;

    iget-object p3, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->this$0:Lcom/flyersoft/components/MyMenu;

    iget-object p3, p3, Lcom/flyersoft/components/MyMenu;->mContext:Landroid/content/Context;

    invoke-direct {p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 438
    :goto_1
    iget-object p3, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->items:[Ljava/lang/CharSequence;

    aget-object p3, p3, p1

    invoke-interface {p3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p3

    .line 439
    const-string v0, "-"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_6

    .line 440
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setHeight(I)V

    const p3, -0x616162

    .line 441
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setBackgroundColor(I)V

    goto :goto_2

    .line 442
    :cond_6
    const-string v0, "#color#"

    invoke-virtual {p3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    const/4 v0, 0x7

    .line 443
    invoke-virtual {p3, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 444
    iget-object p3, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->this$0:Lcom/flyersoft/components/MyMenu;

    invoke-static {p3, p2}, Lcom/flyersoft/components/MyMenu;->-$$Nest$msetTextViewProperties(Lcom/flyersoft/components/MyMenu;Landroid/widget/TextView;)V

    .line 445
    const-string p3, ""

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 446
    :cond_7
    const-string v0, "#html#"

    invoke-virtual {p3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x6

    .line 447
    invoke-virtual {p3, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 448
    iget-object p3, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->this$0:Lcom/flyersoft/components/MyMenu;

    invoke-static {p3, p2}, Lcom/flyersoft/components/MyMenu;->-$$Nest$msetTextViewHtmlProperties(Lcom/flyersoft/components/MyMenu;Landroid/widget/TextView;)V

    goto :goto_2

    :cond_8
    const/4 p3, 0x0

    .line 450
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 451
    iget-object p3, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->items:[Ljava/lang/CharSequence;

    aget-object p3, p3, p1

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 452
    iget-object p3, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->this$0:Lcom/flyersoft/components/MyMenu;

    invoke-static {p3, p2}, Lcom/flyersoft/components/MyMenu;->-$$Nest$msetTextViewProperties(Lcom/flyersoft/components/MyMenu;Landroid/widget/TextView;)V

    .line 453
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 455
    :goto_2
    iget-object p3, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->this$0:Lcom/flyersoft/components/MyMenu;

    iget-boolean p3, p3, Lcom/flyersoft/components/MyMenu;->shadowText:Z

    if-eqz p3, :cond_a

    const/high16 p3, 0x3f800000    # 1.0f

    .line 456
    invoke-static {p3}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v0

    invoke-static {p3}, Lcom/flyersoft/tools/A;->df(F)F

    move-result v1

    invoke-static {p3}, Lcom/flyersoft/tools/A;->df(F)F

    move-result p3

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v2

    if-eqz v2, :cond_9

    const/high16 v2, -0x1000000

    goto :goto_3

    :cond_9
    const/4 v2, -0x1

    :goto_3
    invoke-virtual {p2, v0, v1, p3, v2}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    .line 458
    :cond_a
    iget-object p3, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->this$0:Lcom/flyersoft/components/MyMenu;

    iget-object p3, p3, Lcom/flyersoft/components/MyMenu;->itemBackgroundColors:[I

    if-eqz p3, :cond_b

    iget-object p3, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->this$0:Lcom/flyersoft/components/MyMenu;

    iget-object p3, p3, Lcom/flyersoft/components/MyMenu;->itemBackgroundColors:[I

    aget p3, p3, p1

    if-eqz p3, :cond_b

    .line 459
    iget-object p3, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->this$0:Lcom/flyersoft/components/MyMenu;

    iget-object p3, p3, Lcom/flyersoft/components/MyMenu;->itemBackgroundColors:[I

    aget p3, p3, p1

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 460
    :cond_b
    iget-object p3, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->this$0:Lcom/flyersoft/components/MyMenu;

    iget-object p3, p3, Lcom/flyersoft/components/MyMenu;->onItemLongClick:Lcom/flyersoft/components/MyMenu$MenuItemLongClick;

    if-eqz p3, :cond_c

    .line 462
    iget-object p3, p0, Lcom/flyersoft/components/MyMenu$MyMenuAdapter;->this$0:Lcom/flyersoft/components/MyMenu;

    iget-object p3, p3, Lcom/flyersoft/components/MyMenu;->mContext:Landroid/content/Context;

    invoke-static {p3}, Lcom/flyersoft/tools/A;->getSelectedRes(Landroid/content/Context;)I

    move-result p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 463
    new-instance p3, Lcom/flyersoft/components/MyMenu$MyMenuAdapter$1;

    invoke-direct {p3, p0, p1}, Lcom/flyersoft/components/MyMenu$MyMenuAdapter$1;-><init>(Lcom/flyersoft/components/MyMenu$MyMenuAdapter;I)V

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 471
    new-instance p3, Lcom/flyersoft/components/MyMenu$MyMenuAdapter$2;

    invoke-direct {p3, p0, p1}, Lcom/flyersoft/components/MyMenu$MyMenuAdapter$2;-><init>(Lcom/flyersoft/components/MyMenu$MyMenuAdapter;I)V

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    :cond_c
    return-object p2
.end method
