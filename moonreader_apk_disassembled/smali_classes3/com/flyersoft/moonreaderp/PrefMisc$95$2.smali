.class Lcom/flyersoft/moonreaderp/PrefMisc$95$2;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc$95;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc$95;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc$95;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 2474
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$95$2;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$95;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1

    .line 2477
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$95$2;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$95;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc$95;->val$selfPref:Landroid/app/Dialog;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smrestoreProc(Landroid/app/Dialog;I)V

    return-void
.end method
