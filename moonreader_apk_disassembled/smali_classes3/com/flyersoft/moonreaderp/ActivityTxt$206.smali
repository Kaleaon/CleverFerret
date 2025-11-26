.class Lcom/flyersoft/moonreaderp/ActivityTxt$206;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showPdfRenderEngineOption(Z)V
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

    .line 19386
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$206;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 19389
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$206;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget p2, Lcom/flyersoft/moonreaderp/R$string;->rendering_engine:I

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showVisualOptions(Ljava/lang/String;)V

    return-void
.end method
