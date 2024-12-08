import bcrypt
from sqlalchemy import func
from sqlalchemy.orm import joinedload
from sqlalchemy.orm import Session
import models, schemas

def create_language(db: Session, language: schemas.LanguageCreate):
    db_language = models.Language(**language.model_dump())
    db.add(db_language)
    db.commit()
    db.refresh(db_language)
    return db_language

def list_languages(db: Session):
    return db.query(models.Language).all()

def list_phrases(db: Session):
    return db.query(models.Phrase).all()

def create_phrase(db: Session, phrase: schemas.PhraseCreate):
    db_phrase = models.Phrase(**phrase.model_dump())
    db.add(db_phrase)
    db.commit()
    db.refresh(db_phrase)
    return db_phrase

def update_phrase(db: Session, phrase_id: int, updated_data: schemas.PhraseBase):
    phrase = db.query(models.Phrase).filter(models.Phrase.id == phrase_id).first()
    if not phrase:
        return None
    for key, value in updated_data.model_dump(exclude_unset=True).items():
        setattr(phrase, key, value)
    db.commit()
    db.refresh(phrase)
    return phrase

def delete_phrase(db: Session, phrase_id: int):
    phrase = db.query(models.Phrase).filter(models.Phrase.id == phrase_id).first()
    if not phrase:
        return None
    db.delete(phrase)
    db.commit()
    return phrase

def get_translations_by_phrase_id(db: Session, phrase_id: int):
    return db.query(models.Translation).filter(models.Translation.phrase_id == phrase_id).all()

def get_translations_by_phrase(db: Session, search: str, language_id: int):
    cleaned_phrase = search.rstrip("?")

    phrase = db.query(models.Phrase).filter(
        func.replace(models.Phrase.phrase, '?', '') == cleaned_phrase
    ).first()

    if not phrase:
        return None

    translations = (
        db.query(models.Translation)
        .filter(
            models.Translation.phrase_id == phrase.id,
            models.Translation.language_id == language_id
        )
        .all()
    )
    return translations

def create_translation(db: Session, translation: schemas.TranslationCreate):
    db_translation = models.Translation(**translation.model_dump())
    db.add(db_translation)
    db.commit()
    db.refresh(db_translation)
    return db_translation

def update_translation(db: Session, translation_id: int, updated_data: schemas.TranslationUpdate):
    translation = db.query(models.Translation).filter(models.Translation.id == translation_id).first()
    if not translation:
        return None
    for key, value in updated_data.model_dump(exclude_unset=True).items():
        setattr(translation, key, value)
    db.commit()
    db.refresh(translation)
    return translation

def delete_translation(db: Session, translation_id: int):
    translation = db.query(models.Translation).filter(models.Translation.id == translation_id).first()
    if not translation:
        return None
    db.delete(translation)
    db.commit()
    return translation

def flag_translation(db: Session, flag: schemas.FlagCreate):
    db_flag = models.Flag(**flag.model_dump())
    db.add(db_flag)
    db.commit()
    db.refresh(db_flag)

    user = db.query(models.User).filter(models.User.id == db_flag.user_id).first()
    uname = user.uname if user else "Unknown"

    return {
        "id": db_flag.id,
        "translation_id": db_flag.translation_id,
        "user_id": db_flag.user_id,
        "flag": db_flag.flag,
        "comment": db_flag.comment,
        "created_at": db_flag.created_at,
        "updated_at": db_flag.updated_at,
        "uname": uname
    }

def get_flags_by_translation_id(db: Session, translation_id: int):
    return db.query(models.Flag).options(joinedload(models.Flag.user)).filter(models.Flag.translation_id == translation_id).all()

def create_user(db: Session, user: schemas.UserCreate):
    hash = bcrypt.hashpw(user.pword.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')
    user_data = user.model_dump()
    user_data['pword'] = hash

    db_user = models.User(**user_data)
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user
