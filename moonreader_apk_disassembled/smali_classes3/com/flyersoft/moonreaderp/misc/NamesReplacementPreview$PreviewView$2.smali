.class Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView$2;
.super Ljava/lang/Object;
.source "NamesReplacementPreview.java"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 64
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView$2;->this$0:Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 0

    .line 69
    sput p1, Lcom/flyersoft/tools/A;->namesReplacePriewTab:I

    return-void
.end method
