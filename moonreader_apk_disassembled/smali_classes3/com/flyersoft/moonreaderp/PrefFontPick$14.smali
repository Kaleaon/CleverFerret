.class Lcom/flyersoft/moonreaderp/PrefFontPick$14;
.super Ljava/lang/Object;
.source "PrefFontPick.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFontPick;->showOverflowMenu(Landroid/view/View;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

.field final synthetic val$filename:Ljava/lang/String;

.field final synthetic val$font:Ljava/lang/String;

.field final synthetic val$items:[Ljava/lang/String;

.field final synthetic val$original:Ljava/lang/String;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFontPick;ILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 495
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    iput p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$position:I

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$original:Ljava/lang/String;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$items:[Ljava/lang/String;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$filename:Ljava/lang/String;

    iput-object p6, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$font:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private removeFontFaces(I)V
    .locals 3

    .line 543
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$fgetfontFaces(Lcom/flyersoft/moonreaderp/PrefFontPick;)[Landroid/graphics/Typeface;

    move-result-object v0

    array-length v0, v0

    if-nez v0, :cond_0

    return-void

    .line 545
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$fgetfontFaces(Lcom/flyersoft/moonreaderp/PrefFontPick;)[Landroid/graphics/Typeface;

    move-result-object v0

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    new-array v0, v0, [Landroid/graphics/Typeface;

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p1, :cond_1

    .line 547
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$fgetfontFaces(Lcom/flyersoft/moonreaderp/PrefFontPick;)[Landroid/graphics/Typeface;

    move-result-object v2

    aget-object v2, v2, v1

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    add-int/lit8 p1, p1, 0x1

    .line 548
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$fgetfontFaces(Lcom/flyersoft/moonreaderp/PrefFontPick;)[Landroid/graphics/Typeface;

    move-result-object v1

    array-length v1, v1

    if-ge p1, v1, :cond_2

    add-int/lit8 v1, p1, -0x1

    .line 549
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$fgetfontFaces(Lcom/flyersoft/moonreaderp/PrefFontPick;)[Landroid/graphics/Typeface;

    move-result-object v2

    aget-object v2, v2, p1

    aput-object v2, v0, v1

    goto :goto_1

    .line 550
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$fputfontFaces(Lcom/flyersoft/moonreaderp/PrefFontPick;[Landroid/graphics/Typeface;)V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 5

    const/4 v0, 0x0

    if-nez p1, :cond_1

    .line 499
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getFonts()Ljava/util/ArrayList;

    move-result-object v1

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$position:I

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 500
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/PrefFontPick;->-$$Nest$fgetfontFaces(Lcom/flyersoft/moonreaderp/PrefFontPick;)[Landroid/graphics/Typeface;

    move-result-object v2

    iget v3, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$position:I

    aget-object v2, v2, v3

    if-nez v2, :cond_0

    const/4 v2, 0x0

    .line 502
    invoke-static {v1, v2}, Lcom/flyersoft/tools/A;->getTypeFace(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v2

    .line 503
    :cond_0
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getContext()Landroid/content/Context;

    move-result-object v3

    iget v4, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$position:I

    invoke-static {v3, v1, v2, v4, v0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->doFontWeight(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/Typeface;ILcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;)V

    :cond_1
    const/4 v1, 0x1

    if-ne p1, v1, :cond_2

    .line 506
    new-instance v1, Landroid/widget/EditText;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 507
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$original:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 508
    new-instance v2, Lcom/flyersoft/components/MyDialog;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$items:[Ljava/lang/String;

    aget-object v3, v3, p1

    invoke-virtual {v2, v3}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v2

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;

    invoke-direct {v3, p0, v1}, Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;-><init>(Lcom/flyersoft/moonreaderp/PrefFontPick$14;Landroid/widget/EditText;)V

    const v1, 0x104000a

    .line 509
    invoke-virtual {v2, v1, v3}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->cancel:I

    .line 528
    invoke-virtual {v1, v2, v0}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :cond_2
    const/4 v0, 0x2

    if-ne p1, v0, :cond_4

    .line 532
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$filename:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 533
    sget-object p1, Lcom/flyersoft/tools/A;->localFontfaces:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$font:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 534
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getFonts()Ljava/util/ArrayList;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$font:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 535
    iget p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$position:I

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->removeFontFaces(I)V

    .line 536
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefFontPick;->fontList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    return-void

    .line 538
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :cond_4
    return-void
.end method
