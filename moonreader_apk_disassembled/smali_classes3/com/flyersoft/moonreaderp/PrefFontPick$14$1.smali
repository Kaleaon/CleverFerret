.class Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;
.super Ljava/lang/Object;
.source "PrefFontPick.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFontPick$14;->onClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$14;

.field final synthetic val$et:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFontPick$14;Landroid/widget/EditText;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 509
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$14;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;->val$et:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4

    .line 512
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;->val$et:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->deleteSpecialChar(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 513
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_5

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$14;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$original:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_5

    .line 514
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$14;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$filename:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$14;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$filename:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$14;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$font:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p2, v0, v1}, Lcom/flyersoft/tools/T;->renameFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p2

    if-eqz p2, :cond_4

    .line 515
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$14;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$original:Ljava/lang/String;

    sget-object v0, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$14;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$original:Ljava/lang/String;

    sget-object v0, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 516
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$14;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$font:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    sput-object p2, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    .line 517
    :cond_1
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$14;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getFonts()Ljava/util/ArrayList;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$14;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$original:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$14;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$font:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p2

    const/4 v0, -0x1

    if-eq p2, v0, :cond_2

    .line 519
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$14;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getFonts()Ljava/util/ArrayList;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$14;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$font:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p2, v2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 520
    :cond_2
    sget-object p2, Lcom/flyersoft/tools/A;->localFontfaces:Ljava/util/ArrayList;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$14;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$original:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$14;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$font:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p2

    if-eq p2, v0, :cond_3

    .line 522
    sget-object v0, Lcom/flyersoft/tools/A;->localFontfaces:Ljava/util/ArrayList;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$14;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->val$font:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 523
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$14;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefFontPick;->fontList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    return-void

    .line 525
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$14;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$14$1;->this$1:Lcom/flyersoft/moonreaderp/PrefFontPick$14;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefFontPick$14;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefFontPick;->getContext()Landroid/content/Context;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :cond_5
    return-void
.end method
