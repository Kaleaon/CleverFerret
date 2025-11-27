.class Lcom/flyersoft/moonreaderp/PrefFolderPick$4;
.super Ljava/lang/Object;
.source "PrefFolderPick.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFolderPick;->setPath()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFolderPick;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 223
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$4;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 225
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 226
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    const/4 v2, 0x1

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    and-int/2addr v0, v1

    if-eqz v0, :cond_3

    .line 227
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$4;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    const-string v0, "/storage"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "/sdcard"

    goto :goto_1

    :cond_1
    move-object p1, v0

    .line 228
    :goto_1
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_3

    invoke-static {}, Lcom/flyersoft/tools/miscellaneous/SD;->getSDPath()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 229
    invoke-static {}, Lcom/flyersoft/tools/miscellaneous/SD;->getSDPaths()Ljava/util/ArrayList;

    move-result-object p1

    .line 230
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, v2, :cond_2

    .line 231
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$4;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->-$$Nest$mlistExtSdCards(Lcom/flyersoft/moonreaderp/PrefFolderPick;Ljava/util/ArrayList;)V

    return-void

    .line 234
    :cond_2
    invoke-static {}, Lcom/flyersoft/tools/miscellaneous/SD;->getSDPath()Ljava/lang/String;

    move-result-object p1

    .line 237
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$4;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->-$$Nest$mcreateAdapter(Lcom/flyersoft/moonreaderp/PrefFolderPick;Ljava/lang/String;)V

    return-void
.end method
