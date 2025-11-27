.class Lcom/flyersoft/moonreaderp/ActivityTxt$105$1;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$105;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt$105;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$105;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 11352
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$105$1;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt$105;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 11355
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$105$1;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt$105;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$105;->val$act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdo_speak(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void
.end method
