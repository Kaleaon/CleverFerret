.class Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;
.super Ljava/lang/Object;
.source "PrefGroupBooks.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;

.field final synthetic val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

.field final synthetic val$count:I

.field final synthetic val$showShortcut:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;Lcom/flyersoft/tools/BookDb$BookInfo;ZI)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
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

    .line 543
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->val$showShortcut:Z

    iput p4, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->val$count:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 6

    if-nez p1, :cond_0

    .line 546
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1$1;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1$1;-><init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;)V

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    const/4 v5, 0x0

    const/4 v3, 0x1

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/moonreaderp/PrefEditBook;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefEditBook$OnBookEdited;ZLcom/flyersoft/tools/BookDb$BookInfo;I)V

    .line 550
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->show()V

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 553
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->act:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v2, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-virtual {v1, v2, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->download_cover(Ljava/lang/String;Lcom/flyersoft/tools/BookDb$BookInfo;)V

    .line 554
    :cond_1
    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->val$showShortcut:Z

    const/4 v2, 0x2

    if-eqz v1, :cond_2

    if-ne p1, v2, :cond_2

    .line 555
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->act:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->act:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v3, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v4, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    invoke-static {v1, v3, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->do_add_desktop(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 556
    :cond_2
    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->val$count:I

    sub-int/2addr v1, v2

    if-ne p1, v1, :cond_3

    .line 557
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v3, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/flyersoft/tools/A;->sendFile(Landroid/content/Context;Ljava/lang/String;)V

    .line 558
    :cond_3
    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->val$count:I

    sub-int/2addr v1, v0

    if-ne p1, v1, :cond_4

    .line 560
    new-instance p1, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p1, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 561
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v1, 0x41000000    # 8.0f

    .line 562
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    const/high16 v3, 0x41800000    # 16.0f

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-virtual {p1, v1, v4, v5, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 563
    new-instance v1, Landroid/widget/CheckBox;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 564
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->remove_from_group:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    const/4 v3, 0x0

    .line 565
    invoke-virtual {v1, v3}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 566
    invoke-virtual {v1, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 567
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 568
    new-instance v0, Landroid/widget/CheckBox;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 569
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v4, Lcom/flyersoft/moonreaderp/R$array;->shelf_popup:I

    invoke-static {v1, v4, v2}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 570
    invoke-virtual {v0, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 571
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 572
    new-instance v1, Landroid/widget/CheckBox;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 573
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v4, Lcom/flyersoft/moonreaderp/R$array;->file_related:I

    const/4 v5, 0x6

    invoke-static {v2, v4, v5}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 574
    invoke-virtual {v1, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 575
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 577
    new-instance v2, Lcom/flyersoft/components/MyDialog;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupBooks;

    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->confirmation:I

    invoke-virtual {v2, v3}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1$2;

    invoke-direct {v2, p0, v1, v0}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1$2;-><init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks$4$1;Landroid/widget/CheckBox;Landroid/widget/CheckBox;)V

    const v0, 0x1040013

    .line 578
    invoke-virtual {p1, v0, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const v0, 0x1040009

    const/4 v1, 0x0

    .line 587
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :cond_4
    return-void
.end method
