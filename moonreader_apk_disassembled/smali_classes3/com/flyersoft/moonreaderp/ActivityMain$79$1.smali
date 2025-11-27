.class Lcom/flyersoft/moonreaderp/ActivityMain$79$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$79;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$79;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$79;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 7244
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$79$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$79;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 7246
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$79$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$79;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$79;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$79$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$79;

    iget-boolean p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain$79;->val$fromPopupMenu:Z

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mdeleteSelectedFilesFinal(Lcom/flyersoft/moonreaderp/ActivityMain;Z)V

    return-void
.end method
