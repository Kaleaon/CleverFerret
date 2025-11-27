.class Lcom/flyersoft/views/RulerView$18$1;
.super Ljava/lang/Object;
.source "RulerView.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/RulerView$18;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/RulerView$18;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/RulerView$18;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 838
    iput-object p1, p0, Lcom/flyersoft/views/RulerView$18$1;->this$0:Lcom/flyersoft/views/RulerView$18;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetImageFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 840
    sput-object p2, Lcom/flyersoft/tools/A;->outerImagesFolder:Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 841
    sget-object p2, Lcom/flyersoft/views/RulerView;->custRulerImage:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_0

    .line 842
    sput-object p1, Lcom/flyersoft/views/RulerView;->custRulerImage:Ljava/lang/String;

    .line 843
    invoke-static {}, Lcom/flyersoft/views/RulerView;->-$$Nest$smshowRulerSample()V

    :cond_0
    return-void
.end method
