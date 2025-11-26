.class Lcom/flyersoft/moonreaderp/PrefMisc$107$1;
.super Ljava/lang/Thread;
.source "PrefMisc.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc$107;->onCheckedChanged(Landroid/widget/CompoundButton;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc$107;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc$107;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 2899
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$107$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$107;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 2902
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smgetAllBookFilesSize()Ljava/lang/String;

    move-result-object v0

    .line 2903
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$107$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$107;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefMisc$107;->val$lay:Landroid/view/View;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefMisc$107$1$1;

    invoke-direct {v2, p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc$107$1$1;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc$107$1;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
