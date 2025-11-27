.class Lcom/flyersoft/moonreaderp/ActivityMain$70$2;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$70;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$70;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$70;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 6693
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$70$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$70;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 6695
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$70$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$70;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$70;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshutdown(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void
.end method
