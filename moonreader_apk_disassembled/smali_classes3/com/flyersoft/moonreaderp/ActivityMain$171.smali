.class Lcom/flyersoft/moonreaderp/ActivityMain$171;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->requestGrantSD()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 14227
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$171;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 14230
    :try_start_0
    new-instance p1, Landroid/content/Intent;

    const-string p2, "android.intent.action.OPEN_DOCUMENT_TREE"

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 14231
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$171;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/16 v0, 0xca

    invoke-virtual {p2, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 14233
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 14235
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$171;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 p2, 0x0

    iput-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->sd_grant_dlg:Lcom/flyersoft/components/MyDialog;

    return-void
.end method
