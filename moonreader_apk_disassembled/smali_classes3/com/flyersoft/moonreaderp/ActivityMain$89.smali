.class Lcom/flyersoft/moonreaderp/ActivityMain$89;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->verifyShelfBook(Landroid/content/Context;Lcom/flyersoft/tools/BookDb$BookInfo;Ljava/util/ArrayList;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

.field final synthetic val$con:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/content/Context;Lcom/flyersoft/tools/BookDb$BookInfo;)V
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

    .line 8915
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$89;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$89;->val$con:Landroid/content/Context;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$89;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 8918
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$89;->val$con:Landroid/content/Context;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$89;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->location:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    new-instance v2, Lcom/flyersoft/moonreaderp/ActivityMain$89$1;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$89$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$89;)V

    invoke-direct {p1, p2, v0, v1, v2}, Lcom/flyersoft/moonreaderp/PrefFolderPick;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;)V

    const/4 p2, 0x1

    .line 8933
    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->setBooksOnly(Z)Lcom/flyersoft/moonreaderp/PrefFolderPick;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->show()V

    return-void
.end method
