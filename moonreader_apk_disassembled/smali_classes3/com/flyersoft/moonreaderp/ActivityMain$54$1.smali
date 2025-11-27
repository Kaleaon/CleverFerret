.class Lcom/flyersoft/moonreaderp/ActivityMain$54$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$54;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$54;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$54;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 5055
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$54;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 5058
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$54;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->firstTimeImport:Z

    if-eqz p1, :cond_0

    .line 5059
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$54;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v0, 0x0

    iput-boolean v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->firstTimeImport:Z

    .line 5060
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$54;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->filterTitle:Landroid/widget/TextView;

    if-eqz p1, :cond_0

    .line 5061
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$54$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$54;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->filterTitle:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->performClick()Z

    :cond_0
    return-void
.end method
