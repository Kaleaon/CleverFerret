.class Lcom/flyersoft/moonreaderp/ActivityTxt$245;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->openUrlAsk(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 21679
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$245;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$245;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 21682
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$245;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$245;->val$url:Ljava/lang/String;

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->openUrl(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method
