.class public Lcom/flyersoft/components/androidsvg/SVGImageView;
.super Landroid/widget/ImageView;
.source "SVGImageView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/androidsvg/SVGImageView$LoadResourceTask;,
        Lcom/flyersoft/components/androidsvg/SVGImageView$LoadURITask;
    }
.end annotation


# static fields
.field private static setLayerTypeMethod:Ljava/lang/reflect/Method;


# instance fields
.field private final renderOptions:Lcom/flyersoft/components/androidsvg/RenderOptions;

.field private svg:Lcom/flyersoft/components/androidsvg/SVG;


# direct methods
.method static bridge synthetic -$$Nest$fputsvg(Lcom/flyersoft/components/androidsvg/SVGImageView;Lcom/flyersoft/components/androidsvg/SVG;)V
    .locals 0

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/SVGImageView;->svg:Lcom/flyersoft/components/androidsvg/SVG;

    return-void
.end method

.method static bridge synthetic -$$Nest$mdoRender(Lcom/flyersoft/components/androidsvg/SVGImageView;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/SVGImageView;->doRender()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 5

    .line 63
    :try_start_0
    const-class v0, Landroid/view/View;

    const-string v1, "setLayerType"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Class;

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-class v3, Landroid/graphics/Paint;

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/SVGImageView;->setLayerTypeMethod:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 71
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 54
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/SVGImageView;->svg:Lcom/flyersoft/components/androidsvg/SVG;

    .line 55
    new-instance p1, Lcom/flyersoft/components/androidsvg/RenderOptions;

    invoke-direct {p1}, Lcom/flyersoft/components/androidsvg/RenderOptions;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/SVGImageView;->renderOptions:Lcom/flyersoft/components/androidsvg/RenderOptions;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 77
    invoke-direct {p0, p1, p2, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 54
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/SVGImageView;->svg:Lcom/flyersoft/components/androidsvg/SVG;

    .line 55
    new-instance p1, Lcom/flyersoft/components/androidsvg/RenderOptions;

    invoke-direct {p1}, Lcom/flyersoft/components/androidsvg/RenderOptions;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/SVGImageView;->renderOptions:Lcom/flyersoft/components/androidsvg/RenderOptions;

    .line 78
    invoke-direct {p0, p2, v0}, Lcom/flyersoft/components/androidsvg/SVGImageView;->init(Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 84
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 54
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/SVGImageView;->svg:Lcom/flyersoft/components/androidsvg/SVG;

    .line 55
    new-instance p1, Lcom/flyersoft/components/androidsvg/RenderOptions;

    invoke-direct {p1}, Lcom/flyersoft/components/androidsvg/RenderOptions;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/SVGImageView;->renderOptions:Lcom/flyersoft/components/androidsvg/RenderOptions;

    .line 85
    invoke-direct {p0, p2, p3}, Lcom/flyersoft/components/androidsvg/SVGImageView;->init(Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private doRender()V
    .locals 2

    .line 356
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVGImageView;->svg:Lcom/flyersoft/components/androidsvg/SVG;

    if-nez v0, :cond_0

    return-void

    .line 358
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/SVGImageView;->renderOptions:Lcom/flyersoft/components/androidsvg/RenderOptions;

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/SVG;->renderToPicture(Lcom/flyersoft/components/androidsvg/RenderOptions;)Landroid/graphics/Picture;

    move-result-object v0

    .line 359
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/SVGImageView;->setSoftwareLayerType()V

    .line 360
    new-instance v1, Landroid/graphics/drawable/PictureDrawable;

    invoke-direct {v1, v0}, Landroid/graphics/drawable/PictureDrawable;-><init>(Landroid/graphics/Picture;)V

    invoke-virtual {p0, v1}, Lcom/flyersoft/components/androidsvg/SVGImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method private init(Landroid/util/AttributeSet;I)V
    .locals 3

    .line 91
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/SVGImageView;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 94
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/SVGImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    sget-object v1, Lcom/flyersoft/moonreaderp/R$styleable;->SVGImageView:[I

    const/4 v2, 0x0

    .line 95
    invoke-virtual {v0, p1, v1, p2, v2}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 99
    :try_start_0
    sget p2, Lcom/flyersoft/moonreaderp/R$styleable;->SVGImageView_css:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 101
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVGImageView;->renderOptions:Lcom/flyersoft/components/androidsvg/RenderOptions;

    invoke-virtual {v0, p2}, Lcom/flyersoft/components/androidsvg/RenderOptions;->css(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/RenderOptions;

    .line 104
    :cond_1
    sget p2, Lcom/flyersoft/moonreaderp/R$styleable;->SVGImageView_svg:I

    const/4 v0, -0x1

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    if-eq p2, v0, :cond_2

    .line 106
    invoke-virtual {p0, p2}, Lcom/flyersoft/components/androidsvg/SVGImageView;->setImageResource(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 129
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    .line 112
    :cond_2
    :try_start_1
    sget p2, Lcom/flyersoft/moonreaderp/R$styleable;->SVGImageView_svg:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_5

    .line 115
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 116
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/SVGImageView;->internalSetImageURI(Landroid/net/Uri;)Z

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_3

    .line 129
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    .line 120
    :cond_3
    :try_start_2
    invoke-direct {p0, p2}, Lcom/flyersoft/components/androidsvg/SVGImageView;->internalSetImageAsset(Ljava/lang/String;)Z

    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v0, :cond_4

    .line 129
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    .line 125
    :cond_4
    :try_start_3
    invoke-direct {p0, p2}, Lcom/flyersoft/components/androidsvg/SVGImageView;->setFromString(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 129
    :cond_5
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    :catchall_0
    move-exception p2

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 130
    throw p2
.end method

.method private internalSetImageAsset(Ljava/lang/String;)Z
    .locals 4

    const/4 v0, 0x0

    .line 240
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/SVGImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    .line 241
    new-instance v1, Lcom/flyersoft/components/androidsvg/SVGImageView$LoadURITask;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/flyersoft/components/androidsvg/SVGImageView$LoadURITask;-><init>(Lcom/flyersoft/components/androidsvg/SVGImageView;Lcom/flyersoft/components/androidsvg/SVGImageView-IA;)V

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/io/InputStream;

    aput-object p1, v3, v0

    invoke-virtual {v1, v3}, Lcom/flyersoft/components/androidsvg/SVGImageView$LoadURITask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return v2

    :catch_0
    return v0
.end method

.method private internalSetImageURI(Landroid/net/Uri;)Z
    .locals 4

    const/4 v0, 0x0

    .line 224
    :try_start_0
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/SVGImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p1

    .line 225
    new-instance v1, Lcom/flyersoft/components/androidsvg/SVGImageView$LoadURITask;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/flyersoft/components/androidsvg/SVGImageView$LoadURITask;-><init>(Lcom/flyersoft/components/androidsvg/SVGImageView;Lcom/flyersoft/components/androidsvg/SVGImageView-IA;)V

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/io/InputStream;

    aput-object p1, v3, v0

    invoke-virtual {v1, v3}, Lcom/flyersoft/components/androidsvg/SVGImageView$LoadURITask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return v2

    :catch_0
    return v0
.end method

.method private setFromString(Ljava/lang/String;)V
    .locals 2

    .line 255
    :try_start_0
    invoke-static {p1}, Lcom/flyersoft/components/androidsvg/SVG;->getFromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/SVG;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/SVGImageView;->svg:Lcom/flyersoft/components/androidsvg/SVG;

    .line 256
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/SVGImageView;->doRender()V
    :try_end_0
    .catch Lcom/flyersoft/components/androidsvg/SVGParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 259
    :catch_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Could not find SVG at: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "SVGImageView"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private setSoftwareLayerType()V
    .locals 4

    .line 339
    sget-object v0, Lcom/flyersoft/components/androidsvg/SVGImageView;->setLayerTypeMethod:Ljava/lang/reflect/Method;

    if-nez v0, :cond_0

    goto :goto_0

    .line 344
    :cond_0
    :try_start_0
    const-class v0, Landroid/view/View;

    const-string v1, "LAYER_TYPE_SOFTWARE"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    new-instance v1, Landroid/view/View;

    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/SVGImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v0

    .line 345
    sget-object v1, Lcom/flyersoft/components/androidsvg/SVGImageView;->setLayerTypeMethod:Ljava/lang/reflect/Method;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    const/4 v3, 0x0

    aput-object v3, v2, v0

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 349
    const-string v1, "SVGImageView"

    const-string v2, "Unexpected failure calling setLayerType"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method


# virtual methods
.method public setCSS(Ljava/lang/String;)V
    .locals 1

    .line 173
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/SVGImageView;->renderOptions:Lcom/flyersoft/components/androidsvg/RenderOptions;

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/androidsvg/RenderOptions;->css(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/RenderOptions;

    .line 174
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/SVGImageView;->doRender()V

    return-void
.end method

.method public setImageAsset(Ljava/lang/String;)V
    .locals 2

    .line 208
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/SVGImageView;->internalSetImageAsset(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 209
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "File not found: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "SVGImageView"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public setImageResource(I)V
    .locals 3

    .line 186
    new-instance v0, Lcom/flyersoft/components/androidsvg/SVGImageView$LoadResourceTask;

    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/SVGImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/components/androidsvg/SVGImageView$LoadResourceTask;-><init>(Lcom/flyersoft/components/androidsvg/SVGImageView;Landroid/content/Context;)V

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Integer;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/SVGImageView$LoadResourceTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public setImageURI(Landroid/net/Uri;)V
    .locals 2

    .line 197
    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/SVGImageView;->internalSetImageURI(Landroid/net/Uri;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 198
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "File not found: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "SVGImageView"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public setSVG(Lcom/flyersoft/components/androidsvg/SVG;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 143
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/SVGImageView;->svg:Lcom/flyersoft/components/androidsvg/SVG;

    .line 144
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/SVGImageView;->doRender()V

    return-void

    .line 142
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Null value passed to setSVG()"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setSVG(Lcom/flyersoft/components/androidsvg/SVG;Ljava/lang/String;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 159
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/SVGImageView;->svg:Lcom/flyersoft/components/androidsvg/SVG;

    .line 160
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/SVGImageView;->renderOptions:Lcom/flyersoft/components/androidsvg/RenderOptions;

    invoke-virtual {p1, p2}, Lcom/flyersoft/components/androidsvg/RenderOptions;->css(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/RenderOptions;

    .line 162
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/SVGImageView;->doRender()V

    return-void

    .line 157
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Null value passed to setSVG()"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
