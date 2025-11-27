.class Lcom/flyersoft/moonreaderp/PrefMisc$114$1;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc$114;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc$114;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc$114;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 3069
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$114$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$114;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 3072
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$114$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$114;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc$114;->val$selfPref:Landroid/app/Dialog;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$114$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$114;

    iget p2, p2, Lcom/flyersoft/moonreaderp/PrefMisc$114;->val$fromWhich:I

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smbackupProc(Landroid/app/Dialog;I)V

    return-void
.end method
