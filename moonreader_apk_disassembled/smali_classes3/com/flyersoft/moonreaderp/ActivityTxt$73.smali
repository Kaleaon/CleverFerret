.class Lcom/flyersoft/moonreaderp/ActivityTxt$73;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->initBrightSeek()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 6377
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$73;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    const/4 p1, 0x1

    .line 6379
    sput-boolean p1, Lcom/flyersoft/tools/A;->bluelightEnable:Z

    .line 6380
    sget v0, Lcom/flyersoft/tools/A;->bluelightOpacity:I

    add-int/2addr v0, p1

    sput v0, Lcom/flyersoft/tools/A;->bluelightOpacity:I

    .line 6381
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$73;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mupdateBluelightFilter(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void
.end method
