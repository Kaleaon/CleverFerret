.class Lcom/flyersoft/moonreaderp/PrefTheme$10;
.super Ljava/lang/Object;
.source "PrefTheme.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefTheme;->doImportTheme(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

.field final synthetic val$fromFile:Ljava/lang/String;

.field final synthetic val$themeCount:I


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefTheme;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
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

    .line 703
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$10;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iput p2, p0, Lcom/flyersoft/moonreaderp/PrefTheme$10;->val$themeCount:I

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefTheme$10;->val$fromFile:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetFile(Ljava/lang/String;)V
    .locals 3

    .line 706
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme$10;->val$themeCount:I

    if-lez v0, :cond_0

    .line 707
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme$10;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PrefTheme;->-$$Nest$mdoImportThemeFinal(Lcom/flyersoft/moonreaderp/PrefTheme;Ljava/lang/String;)V

    return-void

    .line 708
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$10;->val$fromFile:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 709
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$10;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$10;->val$fromFile:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\" "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$10;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->not_exists:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    .line 711
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$10;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme$10;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefTheme;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->import_failed:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void
.end method
