.class Lcom/flyersoft/staticlayout/MRTextView$LineRecord;
.super Ljava/lang/Object;
.source "MRTextView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/MRTextView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LineRecord"
.end annotation


# instance fields
.field chars:[C

.field ends:[F

.field starts:[F

.field final synthetic this$0:Lcom/flyersoft/staticlayout/MRTextView;


# direct methods
.method constructor <init>(Lcom/flyersoft/staticlayout/MRTextView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1487
    iput-object p1, p0, Lcom/flyersoft/staticlayout/MRTextView$LineRecord;->this$0:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
