.class public Lcom/vladsch/flexmark/util/html/ui/FontStyle;
.super Ljava/lang/Object;
.source "FontStyle.java"


# static fields
.field public static final BOLD:Lcom/vladsch/flexmark/util/html/ui/FontStyle;

.field public static final BOLD_ITALIC:Lcom/vladsch/flexmark/util/html/ui/FontStyle;

.field public static final ITALIC:Lcom/vladsch/flexmark/util/html/ui/FontStyle;

.field public static final PLAIN:Lcom/vladsch/flexmark/util/html/ui/FontStyle;


# instance fields
.field public final fontStyle:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 24
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/FontStyle;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/FontStyle;-><init>(I)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/FontStyle;->PLAIN:Lcom/vladsch/flexmark/util/html/ui/FontStyle;

    .line 25
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/FontStyle;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/FontStyle;-><init>(I)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/FontStyle;->BOLD:Lcom/vladsch/flexmark/util/html/ui/FontStyle;

    .line 26
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/FontStyle;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/FontStyle;-><init>(I)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/FontStyle;->ITALIC:Lcom/vladsch/flexmark/util/html/ui/FontStyle;

    .line 27
    new-instance v0, Lcom/vladsch/flexmark/util/html/ui/FontStyle;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/FontStyle;-><init>(I)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/FontStyle;->BOLD_ITALIC:Lcom/vladsch/flexmark/util/html/ui/FontStyle;

    return-void
.end method

.method private constructor <init>(I)V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput p1, p0, Lcom/vladsch/flexmark/util/html/ui/FontStyle;->fontStyle:I

    return-void
.end method

.method public static of(I)Lcom/vladsch/flexmark/util/html/ui/FontStyle;
    .locals 2

    and-int/lit8 v0, p0, 0x3

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 44
    sget-object p0, Lcom/vladsch/flexmark/util/html/ui/FontStyle;->BOLD_ITALIC:Lcom/vladsch/flexmark/util/html/ui/FontStyle;

    return-object p0

    :cond_0
    and-int/lit8 v0, p0, 0x1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 45
    sget-object p0, Lcom/vladsch/flexmark/util/html/ui/FontStyle;->BOLD:Lcom/vladsch/flexmark/util/html/ui/FontStyle;

    return-object p0

    :cond_1
    const/4 v0, 0x2

    and-int/2addr p0, v0

    if-ne p0, v0, :cond_2

    .line 46
    sget-object p0, Lcom/vladsch/flexmark/util/html/ui/FontStyle;->ITALIC:Lcom/vladsch/flexmark/util/html/ui/FontStyle;

    return-object p0

    .line 47
    :cond_2
    sget-object p0, Lcom/vladsch/flexmark/util/html/ui/FontStyle;->PLAIN:Lcom/vladsch/flexmark/util/html/ui/FontStyle;

    return-object p0
.end method


# virtual methods
.method public isBold()Z
    .locals 2

    .line 40
    iget v0, p0, Lcom/vladsch/flexmark/util/html/ui/FontStyle;->fontStyle:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isItalic()Z
    .locals 1

    .line 36
    iget v0, p0, Lcom/vladsch/flexmark/util/html/ui/FontStyle;->fontStyle:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method
