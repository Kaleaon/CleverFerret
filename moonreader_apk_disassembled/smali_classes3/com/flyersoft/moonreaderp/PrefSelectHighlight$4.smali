.class Lcom/flyersoft/moonreaderp/PrefSelectHighlight$4;
.super Ljava/lang/Object;
.source "PrefSelectHighlight.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefSelectHighlight;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefSelectHighlight;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 149
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$4;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectHighlight;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 153
    sget-boolean p1, Lcom/flyersoft/tools/A;->showColorTemplate:Z

    if-eq p1, p2, :cond_1

    .line 154
    sput-boolean p2, Lcom/flyersoft/tools/A;->showColorTemplate:Z

    .line 155
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 156
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->colorTemplate:Lcom/flyersoft/views/ColorTemplate;

    sget-boolean p2, Lcom/flyersoft/tools/A;->showColorTemplate:Z

    if-eqz p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    const/16 p2, 0x8

    :goto_0
    invoke-virtual {p1, p2}, Lcom/flyersoft/views/ColorTemplate;->setVisibility(I)V

    .line 157
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->initColorTemplateEvents()V

    :cond_1
    return-void
.end method
