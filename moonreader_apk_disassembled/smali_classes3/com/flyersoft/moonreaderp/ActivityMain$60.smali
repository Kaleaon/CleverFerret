.class Lcom/flyersoft/moonreaderp/ActivityMain$60;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->downloadBook2()V
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

    .line 5866
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$60;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 5868
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$60;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->downloadUrl:Ljava/lang/String;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$60;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->downloadFilename:Ljava/lang/String;

    invoke-static {p1, p2, v0}, Lcom/flyersoft/tools/A;->downloadFileFromBrowser(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
