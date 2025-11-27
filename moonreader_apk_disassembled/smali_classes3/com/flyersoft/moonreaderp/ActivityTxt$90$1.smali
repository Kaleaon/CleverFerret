.class Lcom/flyersoft/moonreaderp/ActivityTxt$90$1;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$90;->onStart(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$90;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$90;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 10286
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$90;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 10289
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$90$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$90;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showReadProgress(I)V

    return-void
.end method
