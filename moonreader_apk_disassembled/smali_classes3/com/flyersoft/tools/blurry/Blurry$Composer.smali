.class public Lcom/flyersoft/tools/blurry/Blurry$Composer;
.super Ljava/lang/Object;
.source "Blurry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/blurry/Blurry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Composer"
.end annotation


# instance fields
.field private animate:Z

.field private async:Z

.field private final blurredView:Landroid/view/View;

.field private final context:Landroid/content/Context;

.field private duration:I

.field private final factor:Lcom/flyersoft/tools/blurry/BlurFactor;


# direct methods
.method static bridge synthetic -$$Nest$fgetcontext(Lcom/flyersoft/tools/blurry/Blurry$Composer;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->context:Landroid/content/Context;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetfactor(Lcom/flyersoft/tools/blurry/Blurry$Composer;)Lcom/flyersoft/tools/blurry/BlurFactor;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$maddView(Lcom/flyersoft/tools/blurry/Blurry$Composer;Landroid/view/ViewGroup;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/tools/blurry/Blurry$Composer;->addView(Landroid/view/ViewGroup;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x12c

    .line 49
    iput v0, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->duration:I

    .line 52
    iput-object p1, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->context:Landroid/content/Context;

    .line 53
    new-instance v0, Landroid/view/View;

    invoke-direct {v0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->blurredView:Landroid/view/View;

    .line 54
    invoke-static {}, Lcom/flyersoft/tools/blurry/Blurry;->-$$Nest$sfgetTAG()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 55
    new-instance p1, Lcom/flyersoft/tools/blurry/BlurFactor;

    invoke-direct {p1}, Lcom/flyersoft/tools/blurry/BlurFactor;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    return-void
.end method

.method private addView(Landroid/view/ViewGroup;Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 118
    iget-object v0, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->blurredView:Landroid/view/View;

    invoke-virtual {v0, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 119
    iget-object p2, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->blurredView:Landroid/view/View;

    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 121
    iget-boolean p1, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->animate:Z

    if-eqz p1, :cond_0

    .line 122
    iget-object p1, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->blurredView:Landroid/view/View;

    iget p2, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->duration:I

    invoke-static {p1, p2}, Lcom/flyersoft/tools/blurry/Helper;->animate(Landroid/view/View;I)V

    :cond_0
    return-void
.end method


# virtual methods
.method public animate()Lcom/flyersoft/tools/blurry/Blurry$Composer;
    .locals 1

    const/4 v0, 0x1

    .line 79
    iput-boolean v0, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->animate:Z

    return-object p0
.end method

.method public animate(I)Lcom/flyersoft/tools/blurry/Blurry$Composer;
    .locals 1

    const/4 v0, 0x1

    .line 84
    iput-boolean v0, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->animate:Z

    .line 85
    iput p1, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->duration:I

    return-object p0
.end method

.method public async()Lcom/flyersoft/tools/blurry/Blurry$Composer;
    .locals 1

    const/4 v0, 0x1

    .line 74
    iput-boolean v0, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->async:Z

    return-object p0
.end method

.method public capture(Landroid/view/View;)Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;
    .locals 4

    .line 90
    new-instance v0, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;

    iget-object v1, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    iget-boolean v3, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->async:Z

    invoke-direct {v0, v1, p1, v2, v3}, Lcom/flyersoft/tools/blurry/Blurry$ImageComposer;-><init>(Landroid/content/Context;Landroid/view/View;Lcom/flyersoft/tools/blurry/BlurFactor;Z)V

    return-object v0
.end method

.method public color(I)Lcom/flyersoft/tools/blurry/Blurry$Composer;
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    iput p1, v0, Lcom/flyersoft/tools/blurry/BlurFactor;->color:I

    return-object p0
.end method

.method public from(Landroid/graphics/Bitmap;)Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer;
    .locals 4

    .line 94
    new-instance v0, Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer;

    iget-object v1, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    iget-boolean v3, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->async:Z

    invoke-direct {v0, v1, p1, v2, v3}, Lcom/flyersoft/tools/blurry/Blurry$BitmapComposer;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;Lcom/flyersoft/tools/blurry/BlurFactor;Z)V

    return-object v0
.end method

.method public onto(Landroid/view/ViewGroup;)V
    .locals 3

    .line 98
    iget-object v0, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    move-result v1

    iput v1, v0, Lcom/flyersoft/tools/blurry/BlurFactor;->width:I

    .line 99
    iget-object v0, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    move-result v1

    iput v1, v0, Lcom/flyersoft/tools/blurry/BlurFactor;->height:I

    .line 101
    iget-boolean v0, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->async:Z

    if-eqz v0, :cond_0

    .line 102
    new-instance v0, Lcom/flyersoft/tools/blurry/BlurTask;

    iget-object v1, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    new-instance v2, Lcom/flyersoft/tools/blurry/Blurry$Composer$1;

    invoke-direct {v2, p0, p1}, Lcom/flyersoft/tools/blurry/Blurry$Composer$1;-><init>(Lcom/flyersoft/tools/blurry/Blurry$Composer;Landroid/view/ViewGroup;)V

    invoke-direct {v0, p1, v1, v2}, Lcom/flyersoft/tools/blurry/BlurTask;-><init>(Landroid/view/View;Lcom/flyersoft/tools/blurry/BlurFactor;Lcom/flyersoft/tools/blurry/BlurTask$Callback;)V

    .line 110
    invoke-virtual {v0}, Lcom/flyersoft/tools/blurry/BlurTask;->execute()V

    return-void

    .line 112
    :cond_0
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v1, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    invoke-static {p1, v2}, Lcom/flyersoft/tools/blurry/Blur;->of(Landroid/view/View;Lcom/flyersoft/tools/blurry/BlurFactor;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 113
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/tools/blurry/Blurry$Composer;->addView(Landroid/view/ViewGroup;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public radius(I)Lcom/flyersoft/tools/blurry/Blurry$Composer;
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    iput p1, v0, Lcom/flyersoft/tools/blurry/BlurFactor;->radius:I

    return-object p0
.end method

.method public sampling(I)Lcom/flyersoft/tools/blurry/Blurry$Composer;
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/flyersoft/tools/blurry/Blurry$Composer;->factor:Lcom/flyersoft/tools/blurry/BlurFactor;

    iput p1, v0, Lcom/flyersoft/tools/blurry/BlurFactor;->sampling:I

    return-object p0
.end method
