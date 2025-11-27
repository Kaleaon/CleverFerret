.class public interface abstract Lcom/vladsch/flexmark/util/html/Attribute;
.super Ljava/lang/Object;
.source "Attribute.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/Immutable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/Immutable<",
        "Lcom/vladsch/flexmark/util/html/Attribute;",
        "Lcom/vladsch/flexmark/util/html/MutableAttribute;",
        ">;"
    }
.end annotation


# static fields
.field public static final CLASS_ATTR:Ljava/lang/String; = "class"

.field public static final ID_ATTR:Ljava/lang/String; = "id"

.field public static final LINK_STATUS_ATTR:Ljava/lang/String; = "Link Status"

.field public static final NAME_ATTR:Ljava/lang/String; = "name"

.field public static final NON_RENDERING_WHEN_EMPTY:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final NO_FOLLOW:Lcom/vladsch/flexmark/util/html/Attribute;

.field public static final NUL:C = '\u0000'

.field public static final STYLE_ATTR:Ljava/lang/String; = "style"

.field public static final TARGET_ATTR:Ljava/lang/String; = "target"

.field public static final TITLE_ATTR:Ljava/lang/String; = "title"


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 17
    const-string v0, "rel"

    const-string v1, "nofollow"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/AttributeImpl;->of(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/AttributeImpl;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/util/html/Attribute;->NO_FOLLOW:Lcom/vladsch/flexmark/util/html/Attribute;

    .line 18
    new-instance v0, Ljava/util/HashSet;

    const-string v1, "name"

    const-string v2, "style"

    const-string v3, "class"

    const-string v4, "id"

    filled-new-array {v3, v4, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/vladsch/flexmark/util/html/Attribute;->NON_RENDERING_WHEN_EMPTY:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public abstract containsValue(Ljava/lang/CharSequence;)Z
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract getValue()Ljava/lang/String;
.end method

.method public abstract getValueListDelimiter()C
.end method

.method public abstract getValueNameDelimiter()C
.end method

.method public abstract isNonRendering()Z
.end method

.method public abstract removeValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;
.end method

.method public abstract replaceValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;
.end method

.method public abstract setValue(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;
.end method
