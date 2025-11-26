.class Lcom/flyersoft/moonreaderp/ActivityMain$172;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->checkSysDarkMode()V
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

    .line 14285
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$172;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1

    .line 14288
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$172;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v0, 0x0

    iput-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->darkDiloag:Lcom/flyersoft/components/MyDialog;

    return-void
.end method
