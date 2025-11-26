.class Lcom/flyersoft/moonreaderp/ActivityMain$107$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefEditBook$OnTagsPick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$107;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$107;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$107;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 9545
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$107;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public save(Ljava/lang/String;)V
    .locals 6

    .line 9547
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$107;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$107;->val$edit:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 9548
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9549
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$107;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$107;->val$sb:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->text2StringList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 9550
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 9551
    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "\n"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_0

    .line 9552
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v4

    if-ne v4, v5, :cond_0

    .line 9553
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 9555
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_3

    .line 9556
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$107;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$107;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->book_tags:I

    invoke-virtual {p1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 9557
    const-string v2, ":"

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 9558
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    const/4 v3, 0x0

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 9559
    :cond_2
    new-instance v2, Lcom/flyersoft/components/MyDialog;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$107;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$107;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v2, v3}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$107;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$107;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->delete:I

    .line 9560
    invoke-virtual {v3, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "?"

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Lcom/flyersoft/tools/T;->combineString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 9561
    invoke-static {v0}, Lcom/flyersoft/tools/T;->stringList2Text(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$107$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$107;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$107;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const v3, 0x104000a

    .line 9562
    invoke-virtual {v2, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/flyersoft/moonreaderp/ActivityMain$107$1$1;

    invoke-direct {v3, p0, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain$107$1$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$107$1;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    invoke-virtual {p1, v2, v3}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    .line 9587
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :cond_3
    return-void
.end method
