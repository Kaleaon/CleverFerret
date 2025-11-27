.class Lcom/flyersoft/moonreaderp/PrefVisual$18;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual;->setSytleMaterialSwitchEvents()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefVisual;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 619
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$18;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 622
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$18;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/PrefVisual;->ignoreSwitchTmp:Z

    if-eqz p1, :cond_0

    goto :goto_0

    .line 623
    :cond_0
    sput-boolean p2, Lcom/flyersoft/tools/A;->fontShadow:Z

    .line 624
    sget-boolean p1, Lcom/flyersoft/tools/A;->fontShadow:Z

    if-eqz p1, :cond_1

    .line 625
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$18;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mrefreshFontStyle(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    return-void

    .line 626
    :cond_1
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 627
    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    const/4 p2, 0x0

    const/high16 v0, -0x1000000

    invoke-virtual {p1, p2, p2, p2, v0}, Lcom/flyersoft/staticlayout/MRTextView;->setShadowLayer(FFFI)V

    .line 628
    sget-object p1, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1, p2, p2, p2, v0}, Lcom/flyersoft/staticlayout/MRTextView;->setShadowLayer(FFFI)V

    .line 629
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$18;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mclearCurlCache(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    :cond_2
    :goto_0
    return-void
.end method
