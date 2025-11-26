.class Lcom/flyersoft/moonreaderp/ActivityTxt$115$1;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$115;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$115;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$115;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 12242
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$115$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$115;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 12245
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$115$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$115;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$115;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    new-instance v1, Lcom/flyersoft/moonreaderp/ActivityTxt$115$1$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$115$1$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$115$1;)V

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getPageShot(ZLcom/flyersoft/tools/T$OnResult;)Landroid/graphics/Bitmap;

    return-void
.end method
