.class Lcom/flyersoft/moonreaderp/PrefPdf$1;
.super Ljava/lang/Object;
.source "PrefPdf.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefPdf;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefPdf;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefPdf;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 95
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefPdf$1;->this$0:Lcom/flyersoft/moonreaderp/PrefPdf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 98
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefPdf$1;->this$0:Lcom/flyersoft/moonreaderp/PrefPdf;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefPdf;->-$$Nest$mshowFlipOptions(Lcom/flyersoft/moonreaderp/PrefPdf;)V

    return-void
.end method
